(() => {
  'use strict';
  const $ = s => document.querySelector(s), esc = s => String(s ?? '').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const names = {'blind-box-plush':['盲盒与毛绒玩具','Blind boxes & plush'],'keychains-gifts':['钥匙链与礼品饰品','Keychains & gifts'],'phone-cases':['手机壳','Phone cases'],'phone-accessories':['手机配件','Phone accessories'],'office-supplies':['办公用品','Office supplies'],'other':['其他好物','Other finds'],'uncategorized':['其他好物','Other finds']};
  let products = [], lang = 'zh', category = '', limit = 48, active = null;
  delete names['blind-box-plush'];
  Object.assign(names, {'blind-box':['盲盒','Blind boxes'],'soft-toys':['毛绒玩具','Soft toys'],'other-toys':['其他玩具与周边','Other toys & accessories']});
  names.squishy = ['捏捏乐','Squishy'];
  const categoryRank = key => ({'blind-box':0,'soft-toys':1,'squishy':1.5,'keychains-gifts':2,'phone-cases':3,'other-toys':4,'phone-accessories':5,'office-supplies':9}[key] ?? 6);
  const t = (zh,en) => lang==='zh'?zh:en;
  const title = p => (lang==='zh'?p.title_zh:p.title_en) || p.title || p.title_en || p.title_zh;
  const cat = p => {
    const key=String(p.category || 'other').split('||')[0];
    const text=[p.title,p.title_zh,p.title_en].filter(Boolean).join(' ');
    if (key === 'squishy' || /捏捏|squish(?:y|ies)\b/i.test(text)) return 'squishy';
    // Blind-box packaging takes precedence over plush material.
    if (/盲盒|blind[\s-]*box(?:es)?\b/i.test(text)) return 'blind-box';
    if (/毛绒|毛絨|soft[\s-]*toys?\b|plush|stuffed[\s-]*(?:toys?|animals?)/i.test(text)) return 'soft-toys';
    if (key==='blind-box-plush') {
      if (/钥匙|鑰匙|key[\s-]*chains?|挂件|掛件/i.test(text)) return 'keychains-gifts';
      return 'other-toys';
    }
    return /1688|imports/i.test(key) || ['other','uncategorized','screen-protectors'].includes(key) ? 'phone-accessories' : key;
  };
  const label = k => names[k]?.[lang==='zh'?0:1] || k;
  const money = value => new Intl.NumberFormat('en-NZ',{style:'currency',currency:'NZD'}).format(value);
  const sale = p => {
    const original = Number(p.price);
    return cat(p) === 'blind-box' && original > 25 ? {original, discounted: Math.round(original * .85 * 100) / 100} : null;
  };
  const price = p => Number(p.price)>0 ? money(Number(p.price)) : t('到店咨询','Enquire in store');
  const priceMarkup = p => {
    const discount = sale(p);
    if (!discount) return `<span class="price">${esc(price(p))}</span>`;
    return `<span class="sale-price"><span class="original-price">${esc(money(discount.original))}</span><strong>${esc(money(discount.discounted))}</strong></span>`;
  };
  function images(p) { return [...new Set([p.image,...(Array.isArray(p.images)?p.images:[])])].filter(s=>typeof s==='string' && s.trim()).map(s=>{try{const u=new URL(s,location.protocol==='file:'?'https://gogoshop.nz/':location.href);return ['https:','http:'].includes(u.protocol)?u.href:'';}catch{return '';}}).filter(Boolean); }
  const photo = (src,lazy=true) => `<div class="photo">${src?`<img src="${esc(src)}" alt="" ${lazy?'loading="lazy"':''} decoding="async" referrerpolicy="no-referrer">`:`<span class="missing">${t('图片待补充','Image coming soon')}</span>`}</div>`;
  const stock = p => `<span class="stock ${p.available?'':'out'}">${p.available?t('店内有货','In stock'):t('暂时缺货','Out of stock')}</span>`;
  function wireImages(root) {root.querySelectorAll('img').forEach(img=>img.addEventListener('error',()=>{const text=document.createElement('span');text.className='missing';text.textContent=t('图片暂不可用','Image unavailable');img.replaceWith(text);},{once:true}));}
  function render() {
    document.documentElement.lang=lang==='zh'?'zh-CN':'en';
    document.querySelectorAll('[data-zh]').forEach(el=>el.textContent=el.dataset[lang]);
    $('#language').textContent=lang==='zh'?'EN':'中文';
    $('.store-label').textContent=t('线下好物 · 到店选购','In-store collection');
    $('#search').placeholder=t('搜索商品或货号','Search products or item codes');
    $('#search').setAttribute('aria-label',$('#search').placeholder);
    [...$('#sort').options].forEach((o,i)=>o.textContent=[t('推荐顺序','Recommended'),t('价格从低到高','Price: low to high'),t('价格从高到低','Price: high to low'),t('商品名称','Product name')][i]);
    const cats=[...new Set(products.map(cat))].sort((a,b)=>categoryRank(a)-categoryRank(b));
    $('#categories').innerHTML=['',...cats].map(k=>`<button type="button" data-category="${esc(k)}" aria-pressed="${k===category}">${esc(k?label(k):t('全部商品','All products'))}</button>`).join('');
    const q=$('#search').value.trim().toLocaleLowerCase();
    const rows=products.filter(p=>(!category||cat(p)===category)&&(!$('#available').checked||p.available)&&(!q||[p.title,p.title_zh,p.title_en,p.sku].join(' ').toLocaleLowerCase().includes(q)));
    const sort=$('#sort').value;
    if(sort==='latest')rows.sort((a,b)=>categoryRank(cat(a))-categoryRank(cat(b)));
    if(sort==='low'||sort==='high')rows.sort((a,b)=>(Number(a.price)-Number(b.price))*(sort==='low'?1:-1));
    if(sort==='name')rows.sort((a,b)=>title(a).localeCompare(title(b),lang));
    $('#count').textContent=t(`${rows.length} 件商品`,`${rows.length} products`);
    $('#status').textContent=rows.length?'':t('没有找到符合条件的商品','No products match your search');
    $('#products').innerHTML=rows.slice(0,limit).map(p=>`<button type="button" class="product" data-id="${esc(p.id)}" aria-label="${esc(title(p))}">${photo(images(p)[0])}<h2>${esc(title(p))}</h2><div class="code">${p.sku?esc(t('货号 ','Item ')+p.sku):'&nbsp;'}</div><div class="price-line">${priceMarkup(p)}${stock(p)}</div></button>`).join('');
    $('#more').hidden=rows.length<=limit;$('#more').textContent=t('查看更多','Show more');wireImages($('#products'));
  }
  function detail(p) {
    active=p;const imgs=images(p);
    $('#detail-content').innerHTML=`<div><div id="main-photo">${photo(imgs[0],false)}</div>${imgs.length>1?`<div class="thumbs">${imgs.map((s,i)=>`<button type="button" data-photo="${i}" aria-label="${t('商品图片','Product image')} ${i+1}"><img src="${esc(s)}" alt="" loading="lazy"></button>`).join('')}</div>`:''}</div><div><p class="eyebrow">${esc(label(cat(p)))}</p><h2>${esc(title(p))}</h2><p class="code">${esc(p.sku?t('货号：','Item: ')+p.sku:'')}</p><div class="detail-price">${priceMarkup(p)}</div>${stock(p)}<p class="detail-note">${t('本商品仅在拾光小铺实体店销售。欢迎到店查看，实际价格与库存以店内为准。','Available at Shiguang Shop in store only. Please visit us; prices and availability are confirmed in store.')}</p></div>`;
    wireImages($('#detail-content'));if(!$('#detail').open)$('#detail').showModal();
  }
  async function load() {
    $('#retry').hidden=true;$('#status').textContent=t('正在加载店内商品…','Loading in-store products…');
    try {
      const c=window.GOGO_SHOP_CONFIG;
      const r=await fetch(c.supabaseUrl+'/rest/v1/rpc/get_offline_showcase',{method:'POST',headers:{apikey:c.supabasePublishableKey,'Content-Type':'application/json'},body:'{}',signal:AbortSignal.timeout(20000)});
      if(!r.ok)throw new Error('Catalog '+r.status);
      const data=await r.json();if(!Array.isArray(data))throw new Error('Invalid catalog');products=data;render();
    } catch(e) {$('#status').textContent=t('商品暂时无法加载，请重试。','Products could not be loaded. Please try again.');$('#retry').hidden=false;}
  }
  $('#search').addEventListener('input',()=>{limit=48;render();});$('#sort').addEventListener('change',render);$('#available').addEventListener('change',()=>{limit=48;render();});
  $('#categories').addEventListener('click',e=>{const b=e.target.closest('[data-category]');if(b){category=b.dataset.category;limit=48;render();}});
  $('#products').addEventListener('click',e=>{const b=e.target.closest('[data-id]');if(b){const p=products.find(p=>p.id===b.dataset.id);if(p)detail(p);}});
  $('#detail-content').addEventListener('click',e=>{const b=e.target.closest('[data-photo]');if(b&&active){$('#main-photo').innerHTML=photo(images(active)[Number(b.dataset.photo)],false);wireImages($('#main-photo'));}});
  $('#language').addEventListener('click',()=>{lang=lang==='zh'?'en':'zh';render();if($('#detail').open&&active)detail(active);});
  $('#close').addEventListener('click',()=>$('#detail').close());$('#detail').addEventListener('click',e=>{if(e.target===$('#detail')){const r=e.target.getBoundingClientRect();if(e.clientX<r.left||e.clientX>r.right||e.clientY<r.top||e.clientY>r.bottom)e.target.close();}});
  $('#more').addEventListener('click',()=>{limit+=48;render();});$('#retry').addEventListener('click',load);load();
})();
