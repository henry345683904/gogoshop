import { readFile, writeFile } from "node:fs/promises";

const sourcePath = new URL("../../online/source-products.raw.json", import.meta.url);
const translationsPath = new URL("../../online/source-product-translations.json", import.meta.url);
const outputPath = new URL("../supabase-online-shop-import.sql", import.meta.url);
const previewPath = new URL("../.codex-online-shop-import-preview.sql", import.meta.url);
const duplicatePreviewPath = new URL("../.codex-online-shop-duplicate-preview.sql", import.meta.url);

const sourceProducts = JSON.parse(await readFile(sourcePath, "utf8"));
const translations = JSON.parse(await readFile(translationsPath, "utf8"));

const ONLINE_SOURCE_CATEGORY_KEYS = Object.freeze({
  "清洁洗护": "online-cleaning-care",
  "健康护理": "online-health-personal-care",
  "家居和装饰": "online-home-decor",
  "宠物用品": "online-pet-supplies",
  "烘焙用具": "online-bakeware",
  "厨具餐具": "online-kitchenware-tableware",
  "一次性用品": "online-disposable-supplies",
  "潮流玩具": "online-trending-toys",
  "玩具潮玩": "online-toys-collectibles",
  "收纳整理": "online-storage-organisation",
  "沙滩戏水": "online-beach-water-play",
  "园艺工具": "online-gardening-tools",
  "五金日杂": "online-hardware-household",
  "汽车用品": "online-automotive",
  "手机配件": "online-phone-accessories",
  "露营和户外": "online-camping-outdoors",
  "运动户外": "online-sports-outdoors",
  "影音设备": "online-audio-video",
  "数码配件": "online-digital-accessories",
  "文具笔具": "online-stationery-writing",
  "电池与插排": "online-batteries-power-boards",
  "包袋配饰": "online-bags-accessories",
  "礼品包装": "online-gift-packaging",
  "清洁厨具": "online-kitchen-cleaning",
  "胶带纸品": "online-tape-paper-products",
  "节日生日": "online-party-celebrations",
  "日用百货": "online-everyday-essentials",
  "服装配饰": "online-clothing-accessories",
  "运动装备": "online-sports-equipment",
  "厨房好物": "online-kitchen-essentials"
});

function extractSku(name, sourceId) {
  const normalizedName = String(name || "").trim();
  const match = normalizedName.match(/(?:\s*)([A-Z]{1,8}[A-Z0-9_-]*\d[A-Z0-9_-]*|\d{4,14})[*,;]*$/);
  if (!match) {
    return { sku: String(sourceId), title: normalizedName, skuIsExtracted: false };
  }
  return {
    sku: match[1],
    title: normalizedName.slice(0, match.index).trim() || normalizedName,
    skuIsExtracted: true
  };
}

function storefrontCategory(sourceCategory) {
  return ONLINE_SOURCE_CATEGORY_KEYS[String(sourceCategory || "").trim()] || "online-other";
}

const rows = sourceProducts.map((source) => {
  const { sku, title, skuIsExtracted } = extractSku(source.name, source.source_id);
  const sourceId = String(source.source_id || "").trim();
  const titleEn = String(translations.products?.[`kdh-${sourceId}`] || "").trim();
  const image = String(source.image || "").trim();
  const stock = source.stock === "售罄" ? 0 : Math.max(0, Number(source.stock) || 0);
  return {
    source_id: sourceId,
    title_en: titleEn || title,
    title_zh: title,
    category: storefrontCategory(source.category),
    source_category: String(source.category || "").trim(),
    price: Math.max(0, Number(source.price) || 0),
    cost_per_item: Math.max(0, Number(source.cost_price) || 0),
    stock,
    sales: Math.max(0, Number(String(source.sales || "0").split("+")[0]) || 0),
    published: source.status === "销售中",
    image,
    sku,
    sku_is_extracted: skuIsExtracted,
    source_created_at: String(source.created_at || "")
  };
});

if (rows.length !== 443) throw new Error(`Expected 443 source products, found ${rows.length}.`);
if (new Set(rows.map((row) => row.source_id)).size !== rows.length) throw new Error("Duplicate source IDs found.");
if (rows.some((row) => !row.source_id || !row.title_en || !row.title_zh || !row.sku || !row.image)) {
  throw new Error("Required source product data is missing.");
}

const sourceJson = JSON.stringify(rows);
if (sourceJson.includes("$online_shop_products$")) throw new Error("Unexpected SQL delimiter in source data.");

const sourceCtes = `with source_rows as (
  select *
  from jsonb_to_recordset(
    $online_shop_products$${sourceJson}$online_shop_products$::jsonb
  ) as source (
    source_id text,
    title_en text,
    title_zh text,
    category text,
    source_category text,
    price numeric,
    cost_per_item numeric,
    stock integer,
    sales integer,
    published boolean,
    image text,
    sku text,
    sku_is_extracted boolean,
    source_created_at text
  )
), normalized_source as (
  select
    source.*,
    regexp_replace(lower(trim(source.title_zh)), '[[:space:][:punct:]]+', '', 'g') as normalized_title_zh,
    regexp_replace(lower(trim(source.title_en)), '[[:space:][:punct:]]+', '', 'g') as normalized_title_en
  from source_rows source
), matched as (
  select
    source.*,
    offline.id as offline_product_id,
    offline.price as offline_price,
    offline.match_kind
  from normalized_source source
  left join lateral (
    select
      product.id,
      product.price,
      case
        when source.sku_is_extracted and lower(trim(product.sku)) = lower(trim(source.sku)) then 'sku'
        when length(source.normalized_title_zh) >= 4 and source.normalized_title_zh in (
          regexp_replace(lower(trim(product.title)), '[[:space:][:punct:]]+', '', 'g'),
          regexp_replace(lower(trim(product.title_zh)), '[[:space:][:punct:]]+', '', 'g')
        ) then 'title_zh'
        else 'title_en'
      end as match_kind
    from public.products product
    where product.sales_channel = 'offline'
      and product.deleted_at is null
      and coalesce(product.tags, '') <> '__gogoshop_purged__'
      and (
        (
          source.sku_is_extracted
          and nullif(trim(product.sku), '') is not null
          and lower(trim(product.sku)) = lower(trim(source.sku))
        )
        or (
          length(source.normalized_title_zh) >= 4
          and source.normalized_title_zh in (
            regexp_replace(lower(trim(product.title)), '[[:space:][:punct:]]+', '', 'g'),
            regexp_replace(lower(trim(product.title_zh)), '[[:space:][:punct:]]+', '', 'g')
          )
        )
        or (
          length(source.normalized_title_en) >= 6
          and source.normalized_title_en in (
            regexp_replace(lower(trim(product.title)), '[[:space:][:punct:]]+', '', 'g'),
            regexp_replace(lower(trim(product.title_en)), '[[:space:][:punct:]]+', '', 'g')
          )
        )
      )
    order by
      case
        when source.sku_is_extracted and lower(trim(product.sku)) = lower(trim(source.sku)) then 0
        when source.normalized_title_zh in (
          regexp_replace(lower(trim(product.title)), '[[:space:][:punct:]]+', '', 'g'),
          regexp_replace(lower(trim(product.title_zh)), '[[:space:][:punct:]]+', '', 'g')
        ) then 1
        else 2
      end,
      product.updated_at desc,
      product.id
    limit 1
  ) offline on true
)`;

const previewSql = `-- Preview the GO GO SHOP online catalogue import without changing data.
${sourceCtes}
select
  count(*)::int as source_rows,
  count(*) filter (where offline_product_id is not null)::int as duplicate_products,
  count(*) filter (where match_kind = 'sku')::int as sku_matches,
  count(*) filter (where match_kind = 'title_zh')::int as chinese_title_matches,
  count(*) filter (where match_kind = 'title_en')::int as english_title_matches,
  count(*) filter (where offline_price > 0 and offline_price <> price)::int as prices_replaced_from_offline,
  count(*) filter (where published)::int as published_products,
  count(*) filter (where not published)::int as draft_products,
  sum(stock)::int as stock_units
from matched;
`;

const duplicatePreviewSql = `-- Inspect possible duplicate products without changing data.
${sourceCtes}
select
  source_id,
  sku || ' @ $' || to_char(price, 'FM999999990.00') as online_product,
  offline_product_id || ' @ $' || to_char(offline_price, 'FM999999990.00') as offline_product,
  match_kind
from matched
where offline_product_id is not null
order by match_kind, sku;
`;

const importSql = `-- Import the separate Online Shop catalogue into the main GO GO SHOP database.
-- Online and offline rows remain separate. For a matched product, the online
-- copy receives the current non-zero offline retail price. Re-running is idempotent and
-- does not overwrite later manual edits to an existing online copy.

begin;

${sourceCtes}
, inserted as (
  insert into public.products (
    id, title, title_en, title_zh, category,
    description, description_en, description_zh,
    price, compare_at_price, cost_per_item, stock, sales, published, sales_channel,
    image, images, vendor, sku, barcode, tags,
    source_url, source_currency, source_price, source_variants, source_attributes,
    deleted_at, deleted_was_published, updated_at
  )
  select
    'online-kdh-' || matched.source_id,
    matched.title_en,
    matched.title_en,
    matched.title_zh,
    matched.category,
    '',
    '',
    '',
    case when matched.offline_price > 0 then matched.offline_price else matched.price end,
    0,
    matched.cost_per_item,
    matched.stock,
    matched.sales,
    matched.published,
    'online',
    matched.image,
    jsonb_build_array(matched.image),
    'GO GO SHOP',
    matched.sku,
    '',
    concat_ws(',', 'online-shop', 'kuaidihe', 'source-id:' || matched.source_id),
    'https://sc.kuaidihe.com/web/fronted.php?r=mall%2Fgoods%2Fedit&id=' || matched.source_id,
    'NZD',
    matched.cost_per_item,
    '[]'::jsonb,
    jsonb_build_array(jsonb_strip_nulls(jsonb_build_object(
      'source_system', 'GO GO SHOP Online Shop',
      'source_id', matched.source_id,
      'source_category', matched.source_category,
      'source_created_at', matched.source_created_at,
      'source_retail_price', matched.price,
      'price_source', case when matched.offline_price > 0 then 'offline' else 'online-shop' end,
      'matched_offline_product_id', matched.offline_product_id,
      'match_kind', matched.match_kind
    ))),
    null,
    false,
    now()
  from matched
  on conflict (id) do nothing
  returning id
)
select count(*)::int as inserted_products from inserted;

commit;

select
  count(*)::int as imported_products,
  count(*) filter (where published)::int as published_products,
  count(*) filter (where not published)::int as draft_products,
  count(*) filter (
    where source_attributes @> '[{"price_source":"offline"}]'::jsonb
  )::int as duplicate_prices_from_offline,
  sum(stock)::int as stock_units,
  count(*) filter (where nullif(trim(image), '') is not null)::int as products_with_images
from public.products
where id like 'online-kdh-%'
  and sales_channel = 'online'
  and deleted_at is null;
`;

await Promise.all([
  writeFile(outputPath, importSql, "utf8"),
  writeFile(previewPath, previewSql, "utf8"),
  writeFile(duplicatePreviewPath, duplicatePreviewSql, "utf8")
]);

const categoryCounts = Object.fromEntries(
  [...new Set(rows.map((row) => row.category))]
    .sort()
    .map((category) => [category, rows.filter((row) => row.category === category).length])
);

console.log(JSON.stringify({
  products: rows.length,
  published: rows.filter((row) => row.published).length,
  drafts: rows.filter((row) => !row.published).length,
  stockUnits: rows.reduce((sum, row) => sum + row.stock, 0),
  productsWithImages: rows.filter((row) => row.image).length,
  categories: categoryCounts,
  output: outputPath.pathname,
  preview: previewPath.pathname,
  duplicatePreview: duplicatePreviewPath.pathname
}, null, 2));
