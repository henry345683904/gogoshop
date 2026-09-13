(() => {
  window.openPosOrderEditor = ({order, products, code, name, escape, money, save, zh}) => {
    document.querySelector('#posOrderEditor')?.remove();
    const t = (cn,en) => zh ? cn : en;
    const dialog = document.createElement('dialog');
    dialog.id = 'posOrderEditor';
    const rows = (order.order_items || []).map(item => ({...item}));
    let busy = false;
    dialog.innerHTML = `<style>
      #posOrderEditor{margin:auto;width:min(900px,94vw);max-height:88dvh;box-sizing:border-box;border:1px solid #ccc;border-radius:8px;padding:20px;color:#222;background:white;overflow:auto}
      #posOrderEditor::backdrop{background:#0008}
      #posOrderEditor header{display:flex;justify-content:space-between;align-items:center;gap:12px}
      #posOrderEditor h2{margin:0;font-size:20px}
      #posOrderEditor label{display:grid;gap:4px;font-size:13px}
      #posOrderEditor input{box-sizing:border-box;min-width:0;width:100%;padding:8px;border:1px solid #bbb;border-radius:4px;font:inherit}
      #posOrderEditor .edit-lines{display:grid;gap:12px;margin:16px 0}
      #posOrderEditor .edit-line{display:grid;grid-template-columns:minmax(0,1fr) 80px 100px 80px 36px;gap:10px;align-items:center;border-bottom:1px solid #ddd;padding-bottom:12px}
      #posOrderEditor .edit-line strong{overflow-wrap:anywhere}
      #posOrderEditor .edit-results{display:grid;gap:4px;max-height:180px;overflow:auto}
      #posOrderEditor .edit-results button{text-align:left;padding:10px;background:#f5f5f5;border:1px solid #ddd;border-radius:4px}
      #posOrderEditor footer{display:flex;flex-wrap:wrap;align-items:end;gap:16px;margin-top:16px}
      #posOrderEditor footer label{max-width:150px}
      #posOrderEditor [data-error]{color:#a32920;white-space:pre-wrap}
      @media(max-width:600px){#posOrderEditor .edit-line{grid-template-columns:1fr 1fr 60px 36px}#posOrderEditor .edit-line>strong{grid-column:1/-1}}
    </style><header><h2>${t('编辑线下订单','Edit offline order')} ${escape(order.order_number)}</h2><button type="button" class="action-button" data-close aria-label="${t('关闭','Close')}"><i data-lucide="x"></i></button></header>
    <form><div class="edit-lines"></div><label>${t('添加商品：货号、条码或名称','Add product: item code, barcode or name')}<input type="search" data-search autocomplete="off"></label><div class="edit-results"></div>
    <footer><label>${t('订单折扣 NZD','Order discount NZD')}<input data-discount type="number" min="0" step="0.01" required value="${Number(order.discount_amount)||0}"></label><strong data-total></strong><button class="button" type="submit">${t('保存订单','Save order')}</button></footer><p data-error role="status"></p></form>`;
    document.body.append(dialog);
    const form=dialog.querySelector('form'), lines=dialog.querySelector('.edit-lines'), error=dialog.querySelector('[data-error]');
    const discount=dialog.querySelector('[data-discount]');
    function totals(){
      const subtotal=rows.reduce((s,r)=>s+Math.round(Number(r.unit_price)*100)*Number(r.quantity),0);
      const value=subtotal-Math.round(Number(discount.value)*100);
      dialog.querySelector('[data-total]').textContent=`${t('合计','Total')}: ${money(value/100)}`;
      return value;
    }
    function render(){
      lines.innerHTML=rows.map((r,i)=>{const product=products.find(p=>p.id===r.product_id);return `<div class="edit-line" data-row="${i}"><strong>${escape(product ? name(product) : r.product_title)}<small style="display:block">${t('货号','Item code')}: ${escape(product ? code(product) : '-')}</small></strong><label>${t('数量','Qty')}<input data-quantity type="number" min="1" max="999999" step="1" required value="${Number(r.quantity)}"></label><label>${t('单价 NZD','Price NZD')}<input data-price type="number" min="0" max="999999.99" step="0.01" required value="${Number(r.unit_price)}"></label><span data-line-total>${money(Number(r.quantity)*Number(r.unit_price))}</span><button type="button" class="action-button" data-remove aria-label="${t('移除商品','Remove item')}"><i data-lucide="trash-2"></i></button></div>`}).join('');
      lines.querySelectorAll('[data-row]').forEach(el=>{
        const i=Number(el.dataset.row);
        el.querySelector('[data-remove]').onclick=()=>{rows.splice(i,1);render()};
        el.querySelectorAll('input').forEach(input=>input.oninput=()=>{
          rows[i].quantity=Number(el.querySelector('[data-quantity]').value);
          rows[i].unit_price=Number(el.querySelector('[data-price]').value);
          el.querySelector('[data-line-total]').textContent=money(rows[i].quantity*rows[i].unit_price);totals();
        });
      });
      window.lucide?.createIcons();totals();
    }
    dialog.querySelector('[data-search]').oninput=event=>{
      const term=event.target.value.trim().toLowerCase(),results=dialog.querySelector('.edit-results');
      const matches=term ? products.filter(p=>!p.deleted_at && `${code(p)} ${p.barcode||''} ${name(p)} ${p.title||''}`.toLowerCase().includes(term)).slice(0,30) : [];
      results.innerHTML=matches.map((p,i)=>`<button type="button" data-add="${i}">${escape(code(p))} · ${escape(name(p))} · ${money(p.price)}</button>`).join('');
      results.querySelectorAll('button').forEach(button=>button.onclick=()=>{
        const p=matches[Number(button.dataset.add)],existing=rows.find(r=>r.product_id===p.id);
        if(existing) existing.quantity+=1; else rows.push({product_id:p.id,product_title:name(p),quantity:1,unit_price:Number(p.price)||0,item_note:''});
        results.replaceChildren();event.target.value='';render();
      });
    };
    discount.oninput=totals;
    dialog.querySelector('[data-close]').onclick=()=>{if(!busy)dialog.close()};
    dialog.addEventListener('cancel',event=>{if(busy)event.preventDefault()});
    dialog.addEventListener('close',()=>dialog.remove());
    form.onsubmit=async event=>{
      event.preventDefault();if(busy||!form.reportValidity())return;
      if(!rows.length || totals()<0){error.textContent=t('订单至少保留一件商品，折扣不能超过小计。','Keep at least one item; discount cannot exceed subtotal.');return;}
      busy=true;error.textContent=t('正在保存…','Saving…');dialog.querySelectorAll('button,input').forEach(el=>el.disabled=true);
      try {await save(rows.map(r=>({product_id:r.product_id,quantity:r.quantity,unit_price:r.unit_price,item_note:r.item_note||''})),Number(discount.value));dialog.close();}
      catch(err){error.textContent=err.message||String(err);}
      finally{busy=false;dialog.querySelectorAll('button,input').forEach(el=>el.disabled=false);}
    };
    render();dialog.showModal();dialog.querySelector('[data-close]').focus();
  };
})();
