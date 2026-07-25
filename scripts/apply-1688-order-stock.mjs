import fs from "node:fs";
import path from "node:path";

const catalogPath = path.resolve(process.argv[2] || "imports/1688-products.json");
const stockPath = path.resolve(process.argv[3] || "imports/1688-order-stock.json");
const hiddenPath = path.resolve(process.argv[4] || "imports/1688-hidden-products.json");

const catalog = JSON.parse(fs.readFileSync(catalogPath, "utf8"));
const stockAudit = JSON.parse(fs.readFileSync(stockPath, "utf8"));
const hiddenCatalog = JSON.parse(fs.readFileSync(hiddenPath, "utf8"));
const stocks = stockAudit.stocks || {};
const existing = new Map((catalog.products || []).map((product) => [String(product.offerId), product]));

for (const product of existing.values()) {
  const offerId = String(product.offerId);
  if (!Object.hasOwn(stocks, offerId)) {
    throw new Error(`Missing purchased stock for 1688 offer ${offerId}`);
  }
  if (product.supplierStock == null) product.supplierStock = Number(product.stock || 0);
  product.stock = Math.max(0, Number(stocks[offerId] || 0));
}

for (const source of hiddenCatalog.products || []) {
  const offerId = String(source.offerId);
  if (existing.has(offerId)) continue;

  const product = {
    attributes: Array.isArray(source.attributes) ? source.attributes : [],
    images: [...new Set((source.images || []).filter(Boolean))],
    offerId,
    priceCny: Math.max(0, Number(source.priceCny || 0)),
    sourceUrl: source.sourceUrl || `https://detail.1688.com/offer/${offerId}.html`,
    stock: Math.max(0, Number(stocks[offerId] || source.stock || 0)),
    supplier: source.supplier || "1688 supplier",
    supplierLink: source.supplierLink || "",
    supplierStock: null,
    title: source.title || `1688 product ${offerId}`,
    variants: Array.isArray(source.variants) ? source.variants : []
  };
  catalog.products.push(product);
  existing.set(offerId, product);
}

const missingOffers = Object.keys(stocks).filter((offerId) => !existing.has(offerId));
if (missingOffers.length) {
  throw new Error(`Catalog is missing purchased offers: ${missingOffers.join(", ")}`);
}

catalog.generatedAt = new Date().toISOString();
catalog.source = "1688 purchased products; inventory reconciled from order quantities";
catalog.totalUrls = catalog.products.length;
catalog.products.sort((a, b) => String(a.offerId).localeCompare(String(b.offerId)));

fs.writeFileSync(catalogPath, `${JSON.stringify(catalog, null, 2)}\n`, "utf8");
console.log(`Updated ${catalog.products.length} products with purchased inventory.`);

