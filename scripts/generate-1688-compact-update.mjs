import fs from "node:fs";
import path from "node:path";

const catalogPath = path.resolve(process.argv[2] || "imports/1688-products.json");
const outputPath = path.resolve(process.argv[3] || "imports/1688-products-compact.sql");
const catalog = JSON.parse(fs.readFileSync(catalogPath, "utf8"));
const hiddenIds = new Set([
  "869311951682",
  "919278574701",
  "941432090250",
  "960273333140",
  "968106247721",
  "985967755398"
]);

const encode = (value) => Buffer.from(String(value || ""), "utf8").toString("hex");
const products = catalog.products || [];
const inventory = products
  .map((product) => [product.offerId, Number(product.stock || 0), (product.images || []).length].join(","))
  .join(";");
const hidden = products
  .filter((product) => hiddenIds.has(String(product.offerId)))
  .map((product) => [
    `'${product.offerId}'`,
    `'${encode(product.title)}'`,
    Number(product.priceCny || 0),
    Number(product.stock || 0),
    `'${encode(product.supplier || "1688 supplier")}'`
  ].join(","))
  .map((row) => `(${row})`)
  .join(",");

const sql = `begin;
insert into public.products(id,title,category,description,price,compare_at_price,cost_per_item,stock,sales,published,image,images,vendor,sku,tags,source_url,source_currency,source_price,source_variants,source_attributes,updated_at)
select '1688-'||x.id,convert_from(decode(x.title_hex,'hex'),'utf8'),'1688 Imports','',round(x.price*1.5*1.15,2),0,round(x.price/4,2),x.stock,0,false,'','[]'::jsonb,convert_from(decode(x.vendor_hex,'hex'),'utf8'),'1688-'||x.id,'1688, imported, draft','https://detail.1688.com/offer/'||x.id||'.html','CNY',x.price,'[]'::jsonb,'[]'::jsonb,now()
from(values${hidden})x(id,title_hex,price,stock,vendor_hex)
on conflict(id)do update set title=excluded.title,price=excluded.price,cost_per_item=excluded.cost_per_item,stock=excluded.stock,vendor=excluded.vendor,source_url=excluded.source_url,source_price=excluded.source_price,updated_at=now();
with d as(select a[1]id,a[2]::int stock,a[3]::int n from regexp_split_to_table('${inventory}',';')s cross join lateral regexp_split_to_array(s,',')a)
update public.products p set stock=d.stock,image='assets/1688/'||d.id||'/01.webp',images=(select jsonb_agg('assets/1688/'||d.id||'/'||lpad(i::text,2,'0')||'.webp' order by i)from generate_series(1,d.n)i),updated_at=now()from d where p.id='1688-'||d.id;
update public.products set cost_per_item=round(source_price/4,2),updated_at=now() where source_currency='CNY' and source_price>0;
commit;`;

fs.writeFileSync(outputPath, `${sql}\n`, "utf8");
console.log(`Generated ${outputPath} (${sql.length} characters).`);
