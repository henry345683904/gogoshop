(() => {
  let identity = '';
  let records = [];
  const number = (value, digits = 2) => Number(value).toLocaleString('en-NZ', {minimumFractionDigits: digits, maximumFractionDigits: digits});
  const escape = value => String(value).replace(/[&<>"']/g, ch => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
  window.renderFreightCalculator = (allowed, language, userId) => {
    const root = document.getElementById('freightCalculator');
    if (!root) return;
    root.hidden = !allowed || !userId;
    if (root.hidden) { root.replaceChildren(); identity = ''; return; }
    const nextIdentity = `${userId}:${language}`;
    if (identity === nextIdentity && root.childElementCount) return;
    identity = nextIdentity;
    const key = `gogoshop_freight_batches_v1_${userId}`;
    const zh = language === 'zh';
    const t = (cn, en) => zh ? cn : en;
    try { records = JSON.parse(localStorage.getItem(key) || '[]'); if (!Array.isArray(records)) records = []; } catch { records = []; }
    root.innerHTML = `
      <style>
        #freightCalculator[hidden]{display:none!important}
        #freightCalculator{border-top:1px solid #ddd;padding:20px 0;margin:20px 0}
        #freightCalculator h2{font-size:20px;margin:0 0 8px}
        #freightCalculator .freight-fields{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:12px;margin:12px 0}
        #freightCalculator label{display:grid;gap:6px;font-size:13px}
        #freightCalculator input,#freightCalculator select{width:100%;min-width:0;min-height:40px;border:1px solid #bbb;border-radius:4px;padding:8px;font:inherit;background:#fff;color:#222}
        #freightCalculator .freight-results{display:flex;flex-wrap:wrap;gap:20px;padding:12px 0}
        #freightCalculator output{display:block;font-size:20px;font-weight:700}
        #freightCalculator .freight-history{overflow:auto;margin-top:12px}
        #freightCalculator table{width:100%;border-collapse:collapse;font-size:13px}
        #freightCalculator td,#freightCalculator th{padding:10px 8px;border-bottom:1px solid #ddd;text-align:left;white-space:nowrap}
        #freightCalculator [hidden]{display:none!important}
        @media(max-width:650px){#freightCalculator .freight-fields{grid-template-columns:repeat(2,minmax(0,1fr))}}
      </style>
      <h2>${t('进货运费与真实成本','Freight & landed cost')}</h2>
      <div class="muted">${t('运费附加值 = 整批运费 ÷ 总件数。不同款数量不同时，请填写各款数量之和。','Freight per item = shipment freight / total units. For mixed quantities, enter the sum of all units.')}</div>
      <form>
        <div class="freight-fields">
          <label>${t('批次 / 发票号','Batch / invoice')}<input name="batch" maxlength="100" required></label>
          <label>${t('进货日期','Purchase date')}<input name="date" type="date" required></label>
          <label>${t('整批运费 NZD','Shipment freight NZD')}<input name="freight" type="number" min="0" step="0.01" required></label>
          <label>${t('数量计算方式','Quantity calculation')}<select name="mode"><option value="total">${t('直接输入总件数','Enter total units')}</option><option value="multiply">${t('种类数 × 每款数量','Types × units per type')}</option></select></label>
          <label data-total>${t('总件数','Total units')}<input name="units" type="number" min="1" step="1" required></label>
          <label data-multiply hidden>${t('商品种类数','Number of types')}<input name="types" type="number" min="1" step="1"></label>
          <label data-multiply hidden>${t('每款数量（各款相同）','Units per type (equal quantities)')}<input name="quantity" type="number" min="1" step="1"></label>
          <label>${t('采购总成本 NZD（选填，含税不含运费）','Purchase cost NZD (optional, tax included, freight excluded)')}<input name="cost" type="number" min="0" step="0.01"></label>
        </div>
        <div class="freight-results" aria-live="polite"></div>
        <button class="button" type="submit">${t('保存本批次','Save batch')}</button>
        <span role="status" class="freight-status"></span>
      </form>
      <p class="muted">${t('单件真实成本 = 原单件成本 + 运费附加值。记录仅保存在本设备当前浏览器，不会自动修改商品成本或售价。','Landed unit cost = original unit cost + freight per item. Records stay in this browser on this device; product costs and prices are not changed automatically.')}</p>
      <details><summary>${t('历史批次（本设备）','Batch history (this device)')}</summary><div class="freight-history"></div></details>`;
    const form = root.querySelector('form');
    const field = name => form.elements.namedItem(name);
    const today = new Date();
    field('date').value = `${today.getFullYear()}-${String(today.getMonth()+1).padStart(2,'0')}-${String(today.getDate()).padStart(2,'0')}`;
    function calculation() {
      const multiply = field('mode').value === 'multiply';
      const units = multiply ? Number(field('types').value) * Number(field('quantity').value) : Number(field('units').value);
      const freight = Number(field('freight').value);
      const cost = field('cost').value === '' ? null : Number(field('cost').value);
      if (field('freight').value === '' || !Number.isSafeInteger(units) || units <= 0 || !Number.isFinite(freight) || freight < 0 || (cost !== null && (!Number.isFinite(cost) || cost < 0))) return null;
      return {units,freight,cost,perUnit:freight/units};
    }
    function update() {
      const multiply = field('mode').value === 'multiply';
      root.querySelector('[data-total]').hidden = multiply;
      root.querySelectorAll('[data-multiply]').forEach(el => {el.hidden=!multiply});
      field('units').required = !multiply; field('units').disabled = multiply;
      for (const name of ['types','quantity']) {field(name).required=multiply;field(name).disabled=!multiply;}
      const value = calculation();
      root.querySelector('.freight-results').innerHTML = value ? `
        <div>${t('总件数','Total units')}<output>${value.units}</output></div>
        <div>${t('每件运费附加值','Freight per item')}<output>NZ$${number(value.perUnit,4)}</output></div>
        ${value.cost === null ? '' : `<div>${t('整批真实成本','Total landed cost')}<output>NZ$${number(value.cost+value.freight)}</output></div><div>${t('平均每件真实成本','Average landed unit cost')}<output>NZ$${number((value.cost+value.freight)/value.units,4)}</output></div>`}` : `<span>${t('请输入运费和有效的总件数。','Enter freight and a valid unit count.')}</span>`;
    }
    function history() {
      root.querySelector('.freight-history').innerHTML = records.length ? `<table><thead><tr>${[t('日期','Date'),t('批次','Batch'),t('总件数','Units'),t('运费 NZD','Freight NZD'),t('每件附加 NZD','Freight/unit NZD'),t('真实总成本 NZD','Landed total NZD')].map(x=>`<th>${x}</th>`).join('')}</tr></thead><tbody>${records.map(r=>`<tr><td>${escape(r.date)}</td><td>${escape(r.batch)}</td><td>${r.units}</td><td>${number(r.freight)}</td><td>${number(r.freight/r.units,4)}</td><td>${r.cost===null?'—':number(r.cost+r.freight)}</td></tr>`).join('')}</tbody></table>` : t('暂无批次','No batches yet');
    }
    form.addEventListener('input',update);
    form.addEventListener('change',update);
    form.addEventListener('submit',event=>{
      event.preventDefault();
      if (!allowed || !form.reportValidity()) return;
      const value = calculation();
      if (!value) return;
      const batch = field('batch').value.trim();
      if (!batch) return;
      const record = {...value,batch,date:field('date').value};
      const next = [record,...records.filter(r=>r.batch!==batch || r.date!==record.date)];
      try {localStorage.setItem(key,JSON.stringify(next));records=next;history();root.querySelector('.freight-status').textContent=t('已保存；同日同批次再次保存会更新记录。','Saved; saving the same batch/date updates its record.');}
      catch {root.querySelector('.freight-status').textContent=t('保存失败，请检查浏览器存储空间。','Could not save. Check browser storage.');}
    });
    update();history();
  };
})();
