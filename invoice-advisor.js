(() => {
  const esc = s => String(s ?? '').replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const numeric = s => Number(String(s ?? '').replace(/NZD|NZ\$|RMB|CNY|[$¥￥,\s]/gi,''));
  const roundedMoney = value => Math.round((value + Number.EPSILON * Math.max(1,Math.abs(value))) * 100) / 100;
  const money = value => roundedMoney(value).toFixed(2);
  const headers = {
    name:/^(description|product( name)?|item description|品名|商品名称|产品名称|描述)$/i,
    code:/^(m[_ ]?pn#?|sku|item( code| no\.?)?|货号|编码)$/i,
    quantity:/^(qty|quantity|数量|采购数量)$/i,
    price:/^(net price|unit price|price|单价|采购单价|价格)$/i
  };
  function parseRows(rows) {
    let mapping = null; const result=[];
    for (const row of rows) {
      const found={};
      row.forEach((cell,i)=>Object.entries(headers).forEach(([k,re])=>{if(re.test(String(cell).trim()))found[k]=i}));
      if(found.quantity!==undefined&&found.price!==undefined){mapping=found;continue;}
      if(!mapping)continue;
      const quantity=numeric(row[mapping.quantity]),price=numeric(row[mapping.price]);
      const name=String(row[mapping.name]??row[mapping.code]??'').trim();
      if(!name||/^(total|subtotal|gst|freight|shipping|合计|运费)\b/i.test(name))continue;
      if(!String(row[mapping.quantity]??'').trim()||!String(row[mapping.price]??'').trim())continue;
      if(!Number.isFinite(quantity)||quantity<=0||!Number.isFinite(price)||price<0)continue;
      result.push({name,code:String(row[mapping.code]??''),quantity,price});
    }
    return result;
  }
  function parseText(text) {
    const lines=text.split(/\r?\n/);
    const tabular=parseRows(lines.map(l=>l.split(/\t|\s{2,}/)));
    if(tabular.length)return tabular;
    // Unstructured candidates require review; never interpret invoice totals as items.
    return lines.flatMap(line=>{
      const m=line.trim().match(/^(\S+)\s+(.+?)\s+(\d+(?:\.\d+)?)\s+[$¥￥]?(\d+\.\d{2})(?:\s+[$¥￥]?\d+\.\d{2})?$/);
      return m&&!/total|subtotal|gst|freight|shipping|合计|运费/i.test(m[2])?[{code:m[1],name:m[2],quantity:Number(m[3]),price:Number(m[4])}]:[];
    });
  }
  const orderColumns = [3,8,18,19,20,31];
  function parse1688(matrix, merges = [], prefix = '') {
    const header = matrix.findIndex(r => /实付/.test(String(r[8] || '')) && /标题|名称/.test(String(r[18] || '')) && /单价/.test(String(r[19] || '')) && /数量/.test(String(r[20] || '')));
    if (header < 0) return null;
    const cell = (r,c) => {
      const merge = merges.find(m => m.s.c === c && m.e.c === c && m.s.r <= r && m.e.r >= r);
      return {value: matrix[merge ? merge.s.r : r]?.[c], anchor: merge ? merge.s.r : r, merged: !!merge};
    };
    const results = []; let previous = null;
    for (let i = header + 1; i < matrix.length; i++) {
      const r = matrix[i], name = String(r[18] ?? '').trim();
      // Footer totals have no product title; merged payments belong to one order only.
      if (!name || /^(合计|总计|实付合计|货品标题|total|grand total)$/i.test(name)) continue;
      const payment = cell(i,8), hasPayment = String(payment.value ?? '').trim() !== '';
      let group;
      if (hasPayment) group = {id: `${prefix}:${payment.anchor}`, paid: numeric(payment.value), supplier: String(cell(i,3).value ?? '')};
      else if (!merges.length && previous) group = previous;
      else group = {id: `${prefix}:missing:${i}`, paid: NaN, supplier: String(cell(i,3).value ?? '')};
      previous = group;
      results.push({code:'', name, supplier: group.supplier, tracking: String(cell(i,31).value ?? ''),
        quantity: String(r[20] ?? '').trim() ? numeric(r[20]) : NaN,
        price: String(r[19] ?? '').trim() ? numeric(r[19]) : NaN,
        groupId: group.id, paid: group.paid});
    }
    return results;
  }
  function allocatePaid(rows) {
    const groups = new Map(), amounts = new Map();
    rows.forEach(r => {if (!groups.has(r.groupId)) groups.set(r.groupId,[]);groups.get(r.groupId).push(r)});
    for (const items of groups.values()) {
      const paid = items[0].paid, cents = Math.round(paid * 100);
      if (!Number.isFinite(paid) || paid < 0 || !Number.isSafeInteger(cents) || items.some(r => r.paid !== paid || !Number.isFinite(r.quantity) || r.quantity <= 0 || !Number.isFinite(r.price) || r.price < 0)) throw Error('Invalid order amounts');
      const base = items.reduce((s,r) => s + r.price*r.quantity,0);
      if (!Number.isFinite(base) || (base === 0 && cents > 0)) throw Error('Missing allocation prices');
      const portions = items.map((r,i) => {const exact = base ? cents*r.price*r.quantity/base : 0;return {r,i,cents:Math.floor(exact),fraction:exact-Math.floor(exact)}});
      // Allocate whole cents so every order reconciles to its actual payment.
      const remainder = cents - portions.reduce((s,p) => s+p.cents,0);
      portions.sort((a,b) => b.fraction-a.fraction || a.i-b.i);
      for (let i=0;i<remainder;i++) portions[i % portions.length].cents++;
      portions.forEach(p => amounts.set(p.r,p.cents/100));
    }
    return rows.map(r => ({...r, allocated:amounts.get(r), price:amounts.get(r)/r.quantity}));
  }
  const libraries = new Map();
  function loadScript(url) {
    if(!libraries.has(url))libraries.set(url,new Promise((resolve,reject)=>{
      const s=document.createElement('script');const timer=setTimeout(()=>{s.remove();libraries.delete(url);reject(Error('Library download timed out'))},45000);
      s.src=url;s.onload=()=>{clearTimeout(timer);resolve()};s.onerror=()=>{clearTimeout(timer);libraries.delete(url);reject(Error('Library download failed'))};document.head.append(s);
    }));
    return libraries.get(url);
  }
  function costs(rows,freight,divisor,tax,margin) {
    const units=rows.reduce((s,r)=>s+r.quantity,0);
    return rows.map(r=>{const unitCost=r.price/divisor*(1+tax/100);const landed=unitCost+freight/units;return {...r,unitCost,landed,suggested:landed/(1-margin/100)}});
  }
  window.InvoiceAdvisor={parseRows,parseText,parse1688,allocatePaid,costs};
  window.mountInvoiceAdvisor=(root,zh,apply)=>{
    const t=(a,b)=>zh?a:b;
    const host=document.createElement('section');host.style.cssText='border-top:1px solid #ddd;margin-top:24px;padding-top:20px';root.append(host);
    let rows=[],fileName='',busy=false,orderMode=false;
    host.innerHTML=`<h2>${t('发票识别与价格建议','Invoice analysis & pricing')}</h2>
      <p class="muted">${t('文件在浏览器内解析，不上传发票。识别后请核对单价、数量及税费；仅用于成本分析，不修改商品。','Files are processed in your browser without uploading invoices. Review quantities, unit prices and tax. Analysis only; products are not modified.')}</p>
      <label>${t('上传发票 / 订单表（单个文件，最大 20MB）','Invoice / purchase sheet (one file, up to 20MB)')}<input data-file type="file" accept=".pdf,.xlsx,.xls,.csv,.txt,.png,.jpg,.jpeg,.webp"></label>
      <div class="freight-fields">
        <label>${t('成本来源','Cost basis')}<select data-basis><option value="cil">CIL · NZD · +15% GST</option><option value="1688">1688 · CNY ÷ 4</option><option value="nzd">NZD · ${t('已含税','tax included')}</option></select></label>
        <label>${t('人民币 / 1 NZD','CNY per NZD')}<input data-rate type="number" min="0.01" step="0.01" value="4"></label>
        <label>${t('额外税率 %','Additional tax %')}<input data-tax type="number" min="0" max="100" step="0.01" value="15"></label>
        <label><span data-freight-label>${t('整批运费','Shipment freight')}</span><input data-freight type="number" min="0" step="0.01" value="0"></label>
        <label>${t('运费币种','Freight currency')}<select data-freight-currency><option value="NZD">NZD</option><option value="CNY">CNY</option></select></label>
        <label>${t('目标毛利率 %','Target gross margin %')}<input data-margin type="number" min="0" max="95" step="1" value="40"></label>
      </div>
      <p class="muted">${t('建议价 = 含运费成本 ÷ (1 − 毛利率)。默认 40%，可调整；未计支付手续费、租金或其他运营费用。','Suggested price = landed cost / (1 − margin). Default 40%, adjustable; payment fees, rent and other operating expenses excluded.')}</p>
      <p data-order-note class="muted" hidden>${t('1688 总表：D 卖家、I 订单实付款、S 标题、T 单价、U 数量、AF 运单号。实付款按各行单价 × 数量的比例分摊，同一订单只计一次，表尾合计不重复计入。海运费按总件数分摊。','1688 sheet: D supplier, I order payment, S title, T unit price, U quantity, AF tracking. Allocate each payment by line value (price × quantity); count each order once and exclude footer totals. Sea freight is allocated by unit count.')}</p>
      <p data-status role="status" aria-live="polite"></p>
      <details><summary data-text-title>${t('识别原文 / 手动粘贴','Extracted text / paste text')}</summary><textarea data-text rows="8" style="width:100%;max-width:100%"></textarea><button type="button" class="button" data-reparse>${t('重新识别原文','Reparse text')}</button></details>
      <p data-total></p><button class="button" type="button" data-apply disabled>${t('将核对后的数量和成本填入上方计算器','Use reviewed quantities and costs in calculator')}</button>
      <div class="freight-history" tabindex="0" role="region" aria-label="${t('采购明细','Purchase items')}" style="max-height:560px"><table><thead style="position:sticky;top:0;background:#fff;z-index:1"><tr></tr></thead><tbody></tbody></table></div>
      <button class="button ghost" type="button" data-add>+ ${t('添加一行','Add row')}</button>`;
    const q=s=>host.querySelector(s),status=s=>{q('[data-status]').textContent=s};
    function configuration(){const rate=Number(q('[data-rate]').value),freight=numeric(q('[data-freight]').value)/(q('[data-freight-currency]').value==='CNY'?rate:1),tax=numeric(q('[data-tax]').value),margin=numeric(q('[data-margin]').value),divisor=q('[data-basis]').value==='1688'?rate:1;return {freight,tax,margin,divisor};}
    function analysisRows(){return orderMode?allocatePaid(rows):rows;}
    function purchaseTotal(values,c){return orderMode?values.reduce((s,r)=>s+Math.round(r.allocated*100),0)/100/c.divisor*(1+c.tax/100):values.reduce((s,r)=>s+r.unitCost*r.quantity,0);}
    function valid(){const c=configuration();if(!rows.length||!rows.every(r=>r.name.trim()&&Number.isFinite(r.quantity)&&r.quantity>0&&Number.isFinite(r.price)&&r.price>=0)||!Object.values(c).every(Number.isFinite)||c.freight<0||c.divisor<=0||c.tax<0||c.tax>100||c.margin<0||c.margin>95)return false;try{analysisRows();return true}catch{return false}}
    function calculate(){
      const ok=valid();q('[data-apply]').disabled=!ok||busy;
      if(!ok){host.querySelectorAll('[data-landed],[data-suggested],[data-allocated]').forEach(el=>{el.textContent='—'});q('[data-total]').textContent=t('请核对数量、单价、实付款及汇率；数量必须大于 0。','Review quantities, prices, payments and exchange rate; quantities must exceed zero.');return;}
      const c=configuration(),values=costs(analysisRows(),c.freight,c.divisor,c.tax,c.margin);
      values.forEach((r,i)=>{const tr=q('tbody').children[i];tr.querySelector('[data-landed]').textContent=r.landed.toFixed(4);tr.querySelector('[data-suggested]').textContent=money(r.suggested);if(orderMode)tr.querySelector('[data-allocated]').textContent=money(r.allocated)});
      const total=purchaseTotal(values,c),units=rows.reduce((s,r)=>s+r.quantity,0);
      const paidText=orderMode?`${t('订单数','Orders')}: ${new Set(rows.map(r=>r.groupId)).size} · ${t('实付合计 CNY','Total paid CNY')}: ${values.reduce((s,r)=>s+r.allocated,0).toFixed(2)} · `:'';
      q('[data-total]').textContent=`${paidText}${t('总件数','Units')}: ${units} · ${t('采购成本','Purchase cost')}: NZ$${money(total)} · ${t('运费 NZD','Freight NZD')}: ${money(c.freight)} · ${t('每件运费 NZD','Freight/unit NZD')}: ${(c.freight/units).toFixed(4)} · ${t('含运费总成本','Landed total')}: NZ$${money(total+c.freight)}`;
    }
    function render(){
      q('[data-order-note]').hidden=!orderMode;q('[data-basis]').disabled=orderMode;q('[data-tax]').disabled=orderMode;
      q('[data-freight-label]').textContent=orderMode?t('整批海运费','Shipment sea freight'):t('整批运费','Shipment freight');
      q('[data-reparse]').disabled=orderMode||busy;q('[data-text]').readOnly=orderMode;
      q('[data-reparse]').hidden=orderMode;q('[data-add]').disabled=busy;
      q('[data-text-title]').textContent=orderMode?t('原表指定的六列','Six selected source columns'):t('识别原文 / 手动粘贴','Extracted text / paste text');
      const headings=orderMode?[t('D · 卖家公司','D · Supplier'),t('I · 订单实付 CNY','I · Order paid CNY'),t('S · 货品标题','S · Product title'),t('T · 单价 CNY','T · Unit price CNY'),t('U · 数量','U · Qty'),t('AF · 运单号','AF · Tracking'),t('分摊实付款 CNY','Allocated payment CNY')]:[t('货号','Code'),t('品名','Name'),t('数量','Qty'),t('采购单价（原币）','Unit price (source currency)')];
      q('thead tr').innerHTML=[...headings,t('含运费成本 NZD','Landed/unit NZD'),t('建议售价 NZD','Suggested price NZD'),''].map(v=>`<th>${v}</th>`).join('');
      const input=(r,key,width)=>{const isNumber=['quantity','price','paid'].includes(key);return `<td><input data-key="${key}" ${isNumber?'type="number" min="0" step="any"':''} value="${esc(isNumber&&!Number.isFinite(r[key])?'':r[key])}" aria-label="${key}" style="min-width:${width}px"></td>`};
      const seen=new Set();
      q('tbody').innerHTML=rows.map((r,i)=>{
        const first=!seen.has(r.groupId);seen.add(r.groupId);
        const cells=orderMode?input(r,'supplier',160)+(first?input(r,'paid',120):`<td>${t('计入同一订单','Same order')}</td>`)+input(r,'name',240)+input(r,'price',100)+input(r,'quantity',80)+input(r,'tracking',160)+'<td data-allocated>—</td>':input(r,'code',90)+input(r,'name',220)+input(r,'quantity',80)+input(r,'price',100);
        return `<tr data-row="${i}">${cells}<td data-landed>—</td><td data-suggested>—</td><td><button type="button" data-remove="${i}" title="${t('移除此行','Remove row')}" aria-label="${t('移除此行','Remove row')}">×</button></td></tr>`;
      }).join('');calculate();
    }
    host.addEventListener('input',e=>{const k=e.target.dataset.key;if(k){const i=Number(e.target.closest('[data-row]').dataset.row);rows[i][k]=['quantity','price','paid'].includes(k)?(e.target.value===''?NaN:Number(e.target.value)):e.target.value;if(k==='paid')rows.forEach(r=>{if(r.groupId===rows[i].groupId)r.paid=rows[i].paid})}calculate();});
    q('[data-basis]').onchange=()=>{q('[data-tax]').value=q('[data-basis]').value==='cil'?'15':'0';calculate()};
    host.addEventListener('click',e=>{if(e.target.hasAttribute('data-remove')){rows.splice(Number(e.target.dataset.remove),1);render()}});
    q('[data-add]').onclick=()=>{rows.push({code:'',name:'',quantity:1,price:0,...(orderMode?{supplier:'',tracking:'',groupId:crypto.randomUUID(),paid:0}:{})});render()};
    q('[data-reparse]').onclick=()=>{rows=parseText(q('[data-text]').value);render();status(t(`识别到 ${rows.length} 行，请逐项核对。`,`Found ${rows.length} rows; review each row.`))};
    q('[data-apply]').onclick=()=>{if(!valid()||busy)return;const c=configuration();apply({batch:fileName||'Invoice',units:rows.reduce((s,r)=>s+r.quantity,0),cost:roundedMoney(purchaseTotal(costs(analysisRows(),0,c.divisor,c.tax,c.margin),c)),freight:roundedMoney(c.freight)});status(t('已填入成本计算器，商品数据未修改。','Calculator updated. Product data was not changed.'))};
    async function ocr(image){await loadScript('https://cdn.jsdelivr.net/npm/tesseract.js@5.1.1/dist/tesseract.min.js');const worker=await Tesseract.createWorker('eng+chi_sim');let timer;try{return (await Promise.race([worker.recognize(image),new Promise((_,reject)=>{timer=setTimeout(()=>reject(Error('OCR timed out; try a clearer image')),120000)})])).data.text}finally{clearTimeout(timer);await worker.terminate()}}
    q('[data-file]').onchange=async()=>{
      const file=q('[data-file]').files[0];if(!file)return;
      if(file.size>20*1024*1024){status(t('文件超过 20MB。','File exceeds 20MB.'));return;}
      busy=true;q('[data-file]').disabled=true;q('[data-apply]').disabled=true;q('[data-text]').value='';rows=[];orderMode=false;render();status(t('正在识别，扫描件首次需下载 OCR 语言包…','Reading invoice; scanned pages require an OCR language download on first use…'));
      try{
        fileName=file.name;let text='';
        if(/\.(xlsx?|csv)$/i.test(file.name)){
          await loadScript('https://cdn.jsdelivr.net/npm/xlsx@0.18.5/dist/xlsx.full.min.js');
          const wb=XLSX.read(await file.arrayBuffer(),{type:'array'});
          const sheets=wb.SheetNames.map(name=>{const sheet=wb.Sheets[name],matrix=XLSX.utils.sheet_to_json(sheet,{header:1,defval:'',range:0,blankrows:true});return {matrix,orders:parse1688(matrix,sheet['!merges']||[],name)}});
          orderMode=sheets.some(s=>s.orders!==null);
          for(const s of sheets){if(orderMode){if(s.orders!==null){rows.push(...s.orders);text+=s.matrix.map(r=>orderColumns.map(c=>r[c]??'').join('\t')).join('\n')+'\n'}}else{rows.push(...parseRows(s.matrix));text+=s.matrix.map(r=>r.join('\t')).join('\n')+'\n'}}
          if(orderMode){q('[data-basis]').value='1688';q('[data-tax]').value='0'}
        }else if(/\.pdf$/i.test(file.name)){
          await loadScript('https://cdn.jsdelivr.net/npm/pdfjs-dist@3.11.174/build/pdf.min.js');pdfjsLib.GlobalWorkerOptions.workerSrc='https://cdn.jsdelivr.net/npm/pdfjs-dist@3.11.174/build/pdf.worker.min.js';
          const pdf=await pdfjsLib.getDocument({data:await file.arrayBuffer(),isEvalSupported:false}).promise;
          try{if(pdf.numPages>30)throw Error(t('请拆分为不超过 30 页的文件。','Split into files of up to 30 pages.'));
          for(let n=1;n<=pdf.numPages;n++){
            const page=await pdf.getPage(n),content=await page.getTextContent();
            const lines=[];for(const item of content.items){if(!item.str?.trim())continue;let line=lines.find(l=>Math.abs(l.y-item.transform[5])<3);if(!line){line={y:item.transform[5],items:[]};lines.push(line)}line.items.push(item)}
            const matrix=lines.sort((a,b)=>b.y-a.y).map(l=>l.items.sort((a,b)=>a.transform[4]-b.transform[4]).map(i=>i.str));
            const pageText=matrix.map(r=>r.join('\t')).join('\n');
            if(pageText.replace(/\s/g,'').length<30){const viewport=page.getViewport({scale:1.6});const canvas=document.createElement('canvas');canvas.width=viewport.width;canvas.height=viewport.height;await page.render({canvasContext:canvas.getContext('2d'),viewport}).promise;text+=(await ocr(canvas))+'\n';}
            else{text+=pageText+'\n';rows.push(...parseRows(matrix));}
          }}finally{await pdf.destroy()}
          if(!rows.length)rows=parseText(text);
        }else if(/\.(png|jpe?g|webp)$/i.test(file.name)){text=await ocr(file);rows=parseText(text)}
        else if(/\.txt$/i.test(file.name)){text=await file.text();rows=parseText(text)}
        else throw Error(t('不支持此文件类型。','Unsupported file type.'));
        q('[data-text]').value=text;status(rows.length?t(`识别到 ${rows.length} 行候选商品。请对照原发票核对，可能有遗漏或错列。`,`Found ${rows.length} candidate items. Check against the invoice for missing or misaligned rows.`):t('未可靠识别出商品行，请查看原文或手动添加明细。','No reliable item rows found. Review extracted text or add rows manually.'));
      }catch(e){status(t('识别失败：','Could not read invoice: ')+e.message)}finally{busy=false;q('[data-file]').disabled=false;render()}
    };
    render();
  };
})();
