import fs from "node:fs";
import path from "node:path";

const inputPath = path.resolve(process.argv[2] || "imports/1688-products.json");
const outputPath = path.resolve(process.argv[3] || "imports/1688-products.sql");
const payload = JSON.parse(fs.readFileSync(inputPath, "utf8"));
const SOURCE_COST_MULTIPLIER = 4;
const SOURCE_PRICE_MULTIPLIER = 1.5 * 1.15;
const roundMoney = (value) => Math.round((Number(value) + Number.EPSILON) * 100) / 100;

const products = (payload.products || []).map((source) => {
  const attributes = Array.isArray(source.attributes) ? source.attributes : [];
  const variants = Array.isArray(source.variants) ? source.variants : [];
  const images = [...new Set((source.images || []).filter(Boolean))];
  const attributeText = attributes.map((item) => `${item.name}: ${item.value}`).join("\n");
  const variantText = variants
    .map((item) => `${item.name}: CNY ${Number(item.priceCny || 0).toFixed(2)}, stock ${Number(item.stock || 0)}`)
    .join("\n");
  const sourcePrice = Number(source.priceCny || 0);

  return {
    id: `1688-${source.offerId}`,
    title: source.title || `1688 product ${source.offerId}`,
    category: "1688 Imports",
    description: [
      source.supplier ? `Supplier: ${source.supplier}` : "",
      attributeText,
      variantText,
      source.sourceUrl ? `Source: ${source.sourceUrl}` : ""
    ].filter(Boolean).join("\n\n"),
    price: roundMoney(sourcePrice * SOURCE_PRICE_MULTIPLIER),
    compare_at_price: 0,
    cost_per_item: roundMoney(sourcePrice * SOURCE_COST_MULTIPLIER),
    stock: Math.max(0, Number(source.stock || 0)),
    sales: 0,
    published: false,
    image: images[0] || "",
    images,
    vendor: source.supplier || "1688 supplier",
    sku: `1688-${source.offerId}`,
    tags: "1688, imported, draft",
    source_url: source.sourceUrl || "",
    source_currency: "CNY",
    source_price: sourcePrice,
    source_variants: variants,
    source_attributes: attributes
  };
});

const sql = `begin;

insert into public.products (
  id, title, category, description, price, compare_at_price, cost_per_item,
  stock, sales, published, image, images, vendor, sku, tags, source_url,
  source_currency, source_price, source_variants, source_attributes, updated_at
)
select
  product.id, product.title, product.category, product.description, product.price,
  product.compare_at_price, product.cost_per_item, product.stock, product.sales,
  product.published, product.image, product.images, product.vendor, product.sku,
  product.tags, product.source_url, product.source_currency, product.source_price,
  product.source_variants, product.source_attributes, now()
from jsonb_to_recordset($products$
${JSON.stringify(products, null, 2)}
$products$::jsonb) as product(
  id text,
  title text,
  category text,
  description text,
  price numeric,
  compare_at_price numeric,
  cost_per_item numeric,
  stock integer,
  sales integer,
  published boolean,
  image text,
  images jsonb,
  vendor text,
  sku text,
  tags text,
  source_url text,
  source_currency text,
  source_price numeric,
  source_variants jsonb,
  source_attributes jsonb
)
on conflict (id) do update set
  title = excluded.title,
  category = excluded.category,
  description = excluded.description,
  price = excluded.price,
  compare_at_price = excluded.compare_at_price,
  cost_per_item = excluded.cost_per_item,
  stock = excluded.stock,
  image = excluded.image,
  images = excluded.images,
  vendor = excluded.vendor,
  sku = excluded.sku,
  tags = excluded.tags,
  source_url = excluded.source_url,
  source_currency = excluded.source_currency,
  source_price = excluded.source_price,
  source_variants = excluded.source_variants,
  source_attributes = excluded.source_attributes,
  updated_at = now();

commit;
`;

fs.mkdirSync(path.dirname(outputPath), { recursive: true });
fs.writeFileSync(outputPath, sql, "utf8");
console.log(`Generated ${outputPath} with ${products.length} products.`);
