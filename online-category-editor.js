(() => {
  let registry = [];
  let loaded = false;
  let dialog;
  let context;
  let current = '';
  let selected = new Set();
  let original = new Set();
  let busy = false;
  let query = '';
  const esc = value => String(value ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const text = (zh, en) => context.lang() === 'zh' ? zh : en;
  const products = () => context.products().filter(p => context.channel(p) === 'online');
  function options(base) {
    const removed = new Set(registry.filter(c => c.deleted).map(c => c.key));
    return [...new Set([...base, ...registry.filter(c => !c.deleted).map(c => c.key)])]
      .filter(k => k && k !== 'All' && !removed.has(k) && !/^online[-_ ]/i.test(k));
  }
  async function load(db) {
    const result = await db.from('online_category_settings').select('key,deleted');
    if (result.error) throw result.error;
    registry = result.data || [];
    loaded = true;
  }
  const allKeys = () => options(products().flatMap(context.keys));
  const dirty = () => selected.size !== original.size || [...selected].some(id => !original.has(id));
  function switchCategory(key) {
    current = key;
    original = new Set(products().filter(p => context.keys(p).includes(key)).map(p => p.id));
    selected = new Set(original);
    query = '';
    render();
  }
  function render() {
    const keys = allKeys();
    dialog.innerHTML = `<form method="dialog" class="category-editor-header"><h2>${text('编辑线上分类','Edit online categories')}</h2><button type="button" data-cat-close class="action-button" aria-label="${text('关闭','Close')}" title="${text('关闭','Close')}"><i data-lucide="x"></i></button></form>
      <div class="category-editor-body"><aside><form data-cat-create class="category-editor-create"><label>${text('新增分类','New category')}<input name="name" required maxlength="100" autocomplete="off"></label><button class="action-button" title="${text('新增分类','Add category')}" aria-label="${text('新增分类','Add category')}"><i data-lucide="plus"></i></button></form>
      <nav aria-label="${text('分类','Categories')}">${keys.map(k => `<button type="button" data-cat-key="${esc(k)}" aria-pressed="${current===k}"><span>${esc(context.name(k))}</span><small>${products().filter(p=>context.keys(p).includes(k)).length}</small></button>`).join('')}</nav></aside>
      <section>${current ? `<form data-cat-rename class="category-editor-rename"><label>${text('分类名称','Category name')}<input name="name" value="${esc(context.name(current))}" maxlength="100" required ${current==='other'?'disabled':''}></label><button class="button ghost" ${current==='other'?'disabled':''}>${text('重命名','Rename')}</button><button type="button" data-cat-delete class="action-button" ${current==='other'?'disabled':''} title="${text('删除分类','Delete category')}" aria-label="${text('删除分类','Delete category')}"><i data-lucide="trash-2"></i></button></form>
      <label class="category-editor-search">${text('搜索商品名称或货号','Search product name or item code')}<input type="search" data-cat-search value="${esc(query)}" autocomplete="off"></label>
      <div class="category-editor-tools"><button type="button" class="button ghost" data-cat-select>${text('选择搜索结果','Select results')}</button><button type="button" class="button ghost" data-cat-clear>${text('取消选择搜索结果','Deselect results')}</button><output data-cat-count></output></div><div class="category-editor-products"></div>` : `<p>${text('请新增或选择分类','Add or select a category')}</p>`}</section></div>
      <footer><p role="status" data-cat-status></p><button type="button" data-cat-save class="button" ${!current?'disabled':''}>${text('保存商品分类','Save product selection')}</button></footer>`;
    renderProducts();
    window.lucide?.createIcons();
  }
  function matches() {
    const needle = query.trim().toLocaleLowerCase();
    return products().filter(p => !needle || [context.productName(p),p.sku,p.barcode].join(' ').toLocaleLowerCase().includes(needle));
  }
  function renderProducts() {
    const list = dialog.querySelector('.category-editor-products');
    if (!list) return;
    const rows = matches();
    list.innerHTML = rows.length ? rows.map(p => `<label class="category-editor-product"><input type="checkbox" data-cat-product="${esc(p.id)}" ${selected.has(p.id)?'checked':''}><img src="${esc(p.image || '')}" loading="lazy" alt=""><span><strong>${esc(context.productName(p))}</strong><small>${esc(p.sku || p.barcode || '')} · ${esc(context.keys(p).map(context.name).join(' / '))}</small></span></label>`).join('') : `<p>${text('没有匹配的商品','No matching products')}</p>`;
    dialog.querySelector('[data-cat-count]').textContent = text(`已选择 ${selected.size} 件商品`,`${selected.size} products selected`);
  }
  function status(message) { dialog.querySelector('[data-cat-status]').textContent = message; }
  async function execute(action, name) {
    if (busy || !context.allowed()) return;
    busy = true;
    dialog.querySelectorAll('button,input').forEach(el=>el.disabled=true);
    status(text('正在保存…','Saving…'));
    try {
      const changes = products().flatMap(p => {
        const keys = context.keys(p);
        let next = keys;
        if (action === 'rename' && keys.includes(current)) next = keys.map(k => k === current ? name : k);
        if (action === 'delete' && keys.includes(current)) next = keys.filter(k => k !== current);
        if (action === 'assign' && selected.has(p.id) !== original.has(p.id)) {
          next = selected.has(p.id) ? [...keys,current] : keys.filter(k => k !== current);
        }
        if (next === keys) return [];
        return [{id:p.id,expected:p.category || '',category:[...new Set(next)].join('||') || 'other'}];
      });
      const result = await context.db.rpc('edit_online_category', {
        p_action:action, p_key:current || name, p_name:name || null,
        p_changes:changes,
        p_add:action==='assign'?[...selected].filter(id=>!original.has(id)):[],
        p_remove:action==='assign'?[...original].filter(id=>!selected.has(id)):[]
      });
      if (result.error) throw result.error;
      await load(context.db);
      const refreshed = await context.refresh();
      if (!refreshed) throw new Error(text('已保存，但商品刷新失败。请关闭后重新打开。','Saved, but products could not refresh. Close and reopen.'));
      switchCategory(action==='delete' ? allKeys()[0] || '' : name || current);
      status(text('已保存到商城','Saved to the store'));
    } catch(error) {
      render();
      status(error.message || String(error));
    } finally { busy=false; }
  }
  async function open(config) {
    context=config;
    if (!context.allowed()) return;
    if (!dialog) {
      dialog=document.createElement('dialog');
      dialog.className='online-category-editor';
      document.body.append(dialog);
      dialog.addEventListener('cancel',e=>{if(busy || (dirty() && !confirm(text('放弃未保存的商品选择？','Discard unsaved product selection?'))))e.preventDefault();});
      dialog.addEventListener('input',e=>{if(e.target.matches('[data-cat-search]')){query=e.target.value;renderProducts();}});
      dialog.addEventListener('change',e=>{const id=e.target.dataset.catProduct;if(id){if(e.target.checked)selected.add(id);else selected.delete(id);dialog.querySelector('[data-cat-count]').textContent=text(`已选择 ${selected.size} 件商品`,`${selected.size} products selected`);}});
      dialog.addEventListener('click',e=>{
        const button=e.target.closest('button'); if(!button || busy)return;
        if(button.hasAttribute('data-cat-close')){if(!dirty() || confirm(text('放弃未保存的商品选择？','Discard unsaved product selection?')))dialog.close();}
        if(button.hasAttribute('data-cat-key')){if(!dirty() || confirm(text('放弃未保存的商品选择？','Discard unsaved product selection?')))switchCategory(button.dataset.catKey);}
        if(button.hasAttribute('data-cat-select')){matches().forEach(p=>selected.add(p.id));renderProducts();}
        if(button.hasAttribute('data-cat-clear')){matches().forEach(p=>selected.delete(p.id));renderProducts();}
        if(button.hasAttribute('data-cat-save'))void execute('assign');
        if(button.hasAttribute('data-cat-delete') && confirm(text('删除此分类？商品不会被删除，其他分类将保留。','Delete this category? Products and their other categories will be kept.')))void execute('delete');
      });
      dialog.addEventListener('submit',e=>{
        e.preventDefault();if(busy)return;
        if(!e.target.matches('[data-cat-create],[data-cat-rename]'))return;
        if(dirty() && !confirm(text('此操作会放弃未保存的商品选择，继续？','Discard unsaved product selection and continue?')))return;
        const name=new FormData(e.target).get('name')?.trim();
        if(!name)return;
        if(allKeys().some(k=>context.name(k).toLocaleLowerCase()===name.toLocaleLowerCase())){status(text('分类名称已存在','Category name already exists'));return;}
        void execute(e.target.matches('[data-cat-create]')?'create':'rename',name);
      });
    }
    current='';selected=new Set();original=new Set();busy=true;render();dialog.showModal();
    status(text('正在加载…','Loading…'));
    try { await load(context.db); if(!await context.refresh())throw new Error(text('商品加载失败，请重试','Could not load products. Try again.'));switchCategory(allKeys()[0] || ''); }
    catch(error){status(error.message || String(error));}
    finally { busy=false; }
  }
  window.GOGO_CATEGORY_EDITOR={open,load,options,get loaded(){return loaded;}};
})();
