import { readFile, writeFile } from "node:fs/promises";

const sourcePath = new URL("../../online/source-products.raw.json", import.meta.url);
const translationsPath = new URL("../../online/source-product-translations.json", import.meta.url);
const outputPath = new URL("../supabase-online-shop-import.sql", import.meta.url);
const previewPath = new URL("../.codex-online-shop-import-preview.sql", import.meta.url);
const duplicatePreviewPath = new URL("../.codex-online-shop-duplicate-preview.sql", import.meta.url);
const nameFormatPath = new URL("../supabase-online-shop-name-format.sql", import.meta.url);

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

const ENGLISH_CASE_OVERRIDES = Object.freeze({
  "a5": "A5",
  "aa": "AA",
  "aaa": "AAA",
  "apple": "Apple",
  "borfone": "BORFONE",
  "borofone": "BOROFONE",
  "c&s": "C&S",
  "carplay": "CarPlay",
  "c&s": "C&S",
  "cr1616": "CR1616",
  "cr1620": "CR1620",
  "cr1625": "CR1625",
  "cr1632": "CR1632",
  "cr2016": "CR2016",
  "cr2025": "CR2025",
  "cr2032": "CR2032",
  "diy": "DIY",
  "eva": "EVA",
  "ffp2": "FFP2",
  "fm": "FM",
  "ios": "iOS",
  "iphone": "iPhone",
  "jesse": "Jesse",
  "kn95": "KN95",
  "led": "LED",
  "maxed": "MAXED",
  "m3a": "M3A",
  "paper smart": "PaperSmart",
  "papersmart": "PaperSmart",
  "pd": "PD",
  "qc3.0": "QC3.0",
  "smileplus": "Smileplus",
  "spongebob": "SpongeBob",
  "type-c": "Type-C",
  "usb": "USB",
  "usb-a": "USB-A",
  "usb-c": "USB-C",
  "vim": "Vim"
});

const SIZE_UNIT_PATTERN = "(?:millimetres?|millimeters?|centimetres?|centimeters?|metres?|meters?|inches?|yards?|millilitres?|milliliters?|kilograms?|grams?|litres?|liters?|mm|cm|ml|kg|inch|yard|m|g|l|in)";
const FRACTION_SIZE_PATTERN = /\b\d+\/\d+\s*(?:millimetres?|millimeters?|centimetres?|centimeters?|metres?|meters?|inches?|yards?|millilitres?|milliliters?|kilograms?|grams?|litres?|liters?|mm|cm|ml|kg|inch|yard|m|g|l|in)\b/gi;
const SIZE_PATTERN = new RegExp(
  `\\b(?:` +
    `\\d+(?:\\.\\d+)?\\s*(?:[-\\u2010\\u2011\\u2012\\u2013\\u2014]\\s*\\d+(?:\\.\\d+)?)\\s*${SIZE_UNIT_PATTERN}` +
    `|\\d+(?:\\.\\d+)?\\s*(?:${SIZE_UNIT_PATTERN})\\s*(?:[x\\u00d7*]\\s*\\d+(?:\\.\\d+)?\\s*(?:${SIZE_UNIT_PATTERN})?)+` +
    `|\\d+(?:\\.\\d+)?\\s*(?:[x\\u00d7*]\\s*\\d+(?:\\.\\d+)?\\s*)+${SIZE_UNIT_PATTERN}` +
    `|\\d+(?:\\.\\d+)?\\s*${SIZE_UNIT_PATTERN}` +
  `)(?![A-Za-z0-9])`,
  "gi"
);
const WORD_SIZE_PATTERN = /\b(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety)(?:-[a-z]+)?[- ](?:millimetres?|millimeters?|centimetres?|centimeters?|metres?|meters?|inches?|yards?|millilitres?|milliliters?|kilograms?|grams?|litres?|liters?|mm|cm|ml|kg|inch|yard|m|g|l|in)\b/gi;
const HYPHEN_SIZE_PATTERN = /\b\d+(?:\.\d+)?-(?:millimetres?|millimeters?|centimetres?|centimeters?|metres?|meters?|inches?|yards?|millilitres?|milliliters?|kilograms?|grams?|litres?|liters?|mm|cm|ml|kg|inch|yard|m|g|l|in)\b/gi;

function normalizeSize(value) {
  return String(value || "")
    .toLowerCase()
    .replace(/[\u2010\u2011\u2012\u2013\u2014]/g, "-")
    .replace(/[x\u00d7]/g, "*")
    .replace(/millimet(?:re|er)s?/g, "mm")
    .replace(/centimet(?:re|er)s?/g, "cm")
    .replace(/met(?:re|er)s?/g, "m")
    .replace(/millilit(?:re|er)s?/g, "ml")
    .replace(/kilograms?/g, "kg")
    .replace(/grams?/g, "g")
    .replace(/lit(?:re|er)s?/g, "l")
    .replace(/inch(?:es)?/g, "in")
    .replace(/yards?/g, "yd")
    .replace(/\s+/g, "")
    .replace(/(\d)-(?=(?:cm|mm|m|ml|kg|g|l|in|yd)\b)/g, "$1")
    .replace(/([0-9])(?:cm|mm|m|ml|kg|g|l|in|yd)(?=\*)/g, "$1")
    .trim();
}

function normalizeWordSize(value) {
  const words = String(value || "").toLowerCase().trim();
  const numberWords = {
    one: "1", two: "2", three: "3", four: "4", five: "5", six: "6",
    seven: "7", eight: "8", nine: "9", ten: "10", eleven: "11",
    twelve: "12", twenty: "20", thirty: "30", forty: "40", fifty: "50",
    sixty: "60", seventy: "70", eighty: "80", ninety: "90"
  };
  const match = words.match(/^([a-z]+)(?:-([a-z]+))?[- ](.+)$/);
  if (!match) return words;
  const number = Number(numberWords[match[1]] || 0)
    + Number(numberWords[match[2]] || 0);
  return normalizeSize(String(number) + match[3]);
}

function titleCaseWord(value) {
  const word = String(value || "");
  if (!word) return word;
  const override = ENGLISH_CASE_OVERRIDES[word.toLowerCase()];
  if (override) return override;
  if (/^[A-Za-z](?=[A-Za-z0-9_-]*\d)[A-Za-z0-9_-]+$/.test(word)) return word.toUpperCase();
  if (/^[A-Z0-9][A-Za-z0-9./+_-]*$/.test(word) && /\d/.test(word)) return word;
  if (/^[A-Z]{2,}(?:-[A-Z0-9]+)*$/.test(word)) return word;
  if (/^\d+-[a-z]/.test(word)) {
    return word[0] + "-" + word[2].toUpperCase() + word.slice(3).toLowerCase();
  }
  return word
    .toLowerCase()
    .split(/([-.])/)
    .map((part) => /^[.-]$/.test(part) || !part ? part : part[0].toUpperCase() + part.slice(1))
    .join("");
}

function titleCaseEnglish(value) {
  return String(value || "")
    .split(/(\s+|[(),+/&])/)
    .map((part) => /^\s+$/.test(part) || /^[(),+/&]$/.test(part) ? part : titleCaseWord(part))
    .join("")
    .replace(/\s{2,}/g, " ")
    .replace(/\b(\d+)-([a-z])/gi, (_match, number, letter) => number + "-" + letter.toUpperCase())
    .trim();
}

function cleanNameText(value) {
  return String(value || "")
    .replace(/\s+/g, " ")
    .replace(/\s*[,;]+\s*/g, " ")
    .replace(/\s*:\s*/g, ":")
    .replace(/\s*'\s*/g, "'")
    .replace(/([A-Za-z])\.\s*(?=[A-Za-z0-9])/g, "$1 ")
    .replace(/(\d)\.\s*(?=[A-Za-z])/g, "$1 ")
    .replace(/\s+([.)])/g, "$1")
    .replace(/([.(])\s+/g, "$1")
    .replace(/(^|\s)-(?=[A-Za-z])/g, "$1")
    .replace(/\.{2,}/g, ".")
    .replace(/[.]$/, "")
    .trim();
}

function formatOnlineEnglishProductName(value) {
  let working = String(value || "")
    .replace(/[\u00a0\u2007\u202f]/g, " ")
    .replace(/[\u2010\u2011\u2012\u2013\u2014]/g, "-")
    .replace(/(\d+(?:\.\d+)?)c(?=\*)/gi, "$1cm")
    .replace(/\b(\d+)\.(\d{2})\.(\d)\s*(cm|mm|m)\b/gi, "$1*$2*$3$4")
    .replace(/\s+/g, " ")
    .trim();
  const specifications = [];

  const addSpecification = (valueToAdd, isSize = false) => {
    const normalized = isSize ? normalizeSize(valueToAdd) : cleanNameText(valueToAdd);
    if (!normalized || /^[^A-Za-z0-9]+$/.test(normalized)) return;
    const formatted = isSize ? normalized : titleCaseEnglish(normalized.replace(/^in\s+/i, ""));
    if (formatted && !specifications.some((item) => item.toLowerCase() === formatted.toLowerCase())) {
      specifications.push(formatted);
    }
  };

  const extractSizes = (valueToExtract) => {
    let remainder = String(valueToExtract || "");
    for (const pattern of [WORD_SIZE_PATTERN, FRACTION_SIZE_PATTERN, HYPHEN_SIZE_PATTERN, SIZE_PATTERN]) {
      remainder = remainder.replace(pattern, (size) => {
        addSpecification(
          pattern === WORD_SIZE_PATTERN ? normalizeWordSize(size) : size,
          true
        );
        return " ";
      });
    }
    return remainder;
  };

  working = working.replace(/\(([^()]*)\)/g, (_match, inner) => {
    const remainder = extractSizes(inner);
    remainder.split(/\s*[,;]\s*/).forEach((item) => addSpecification(item));
    return " ";
  });

  working = extractSizes(working);

  working = cleanNameText(working)
    .replace(/\b(\d+)\s*(?:pieces?|pcs?|packs?|packages?|sets?)\b/gi, "$1pc")
    .replace(/\s+/g, " ")
    .trim();
  let quantityPrefix = "";
  const leadingPack = working.match(/^\s*(\d+)pc\b/i);
  if (leadingPack) {
    quantityPrefix = leadingPack[1] + "pc ";
    working = working.slice(leadingPack[0].length).trim();
  }
  const trailingPack = working.match(/\b(\d+)pc\s*$/i);
  if (trailingPack) {
    quantityPrefix = trailingPack[1] + "pc ";
    working = working.slice(0, trailingPack.index).trim();
  }
  working = working.replace(/^(?:and|of|in)\s+/i, "").trim();
  const name = titleCaseEnglish(quantityPrefix + (working || "Product"))
    .replace(/\bC\s*&\s*S\b/gi, "C&S")
    .replace(/\s+([,.)])/g, "$1")
    .replace(/([,(])\s+/g, "$1")
    .replace(/\s{2,}/g, " ")
    .trim();
  return specifications.length ? name + " (" + specifications.join(", ") + ")" : name;
}

function sqlLiteral(value) {
  return `'${String(value || "").replace(/'/g, "''")}'`;
}

const rows = sourceProducts.map((source) => {
  const { sku, title, skuIsExtracted } = extractSku(source.name, source.source_id);
  const sourceId = String(source.source_id || "").trim();
  const titleEn = formatOnlineEnglishProductName(
    translations.products?.[`kdh-${sourceId}`] || ""
  );
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

const nameFormatSql = `-- Normalize English names for the separate Online Shop catalogue only.
-- Dimensions, capacities, and lengths are grouped at the end of each name.
-- This migration does not change offline products or any product data besides title/title_en.

begin;

with name_map(id, formatted_title) as (
  values
${rows.map((row) => `    (${sqlLiteral(`online-kdh-${row.source_id}`)}, ${sqlLiteral(row.title_en)})`).join(",\n")}
)
update public.products product
set
  title = name_map.formatted_title,
  title_en = name_map.formatted_title,
  updated_at = now()
from name_map
where product.id = name_map.id
  and product.sales_channel = 'online'
  and product.id like 'online-kdh-%'
  and product.deleted_at is null;

commit;

select
  count(*) filter (
    where sales_channel = 'offline'
      and deleted_at is null
  )::int as offline_products,
  count(*) filter (
    where sales_channel = 'online'
      and id like 'online-kdh-%'
      and deleted_at is null
  )::int as online_products,
  count(*) filter (
    where sales_channel = 'online'
      and id like 'online-kdh-%'
      and nullif(trim(title_en), '') is not null
      and deleted_at is null
  )::int as online_named_products
from public.products;
`;

await Promise.all([
  writeFile(outputPath, importSql, "utf8"),
  writeFile(previewPath, previewSql, "utf8"),
  writeFile(duplicatePreviewPath, duplicatePreviewSql, "utf8"),
  writeFile(nameFormatPath, nameFormatSql, "utf8")
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
  nameFormat: nameFormatPath.pathname,
  preview: previewPath.pathname,
  duplicatePreview: duplicatePreviewPath.pathname
}, null, 2));
