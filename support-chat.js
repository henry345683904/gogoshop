(() => {
  let context, owner = '', selected = '', opened = false, busy = false, revision = 0;
  let root, panel, inbox, pending = null;
  const drafts = new Map();
  const tr = (zh, en) => context?.lang === 'zh' ? zh : en;
  const esc = value => String(value ?? '').replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));
  const icon = name => `<i data-lucide="${name}"></i>`;
  const date = value => new Date(value).toLocaleString(context?.lang === 'zh' ? 'zh-CN' : 'en-NZ');
  const errorText = () => tr('消息暂时无法加载或发送，请稍后重试。', 'Messages are unavailable. Please try again shortly.');
  function icons() { window.lucide?.createIcons(); }
  function greeting() {
    if (window.SupportSettings) return window.SupportSettings.greeting(context?.lang);
    return `<div class="support-message support-greeting"><strong>${tr('客服 · 自动问候','Support · Automatic greeting')}</strong><div>${tr('您好，欢迎来到 GO GO SHOP！有什么可以帮到您？','Hello, welcome to GO GO SHOP! How can we help you?')}</div><div>${tr('您可以在这个对话框中留言，客服看到后会回复您。也可以添加客服微信（WeChat）或通过 WhatsApp 联系我们。','Leave a message in this chat and our team will reply when available. You can also contact our team through WeChat or WhatsApp.')}</div><div>${tr('客服微信号','WeChat ID')}: <b>GoGoShop_NZ</b></div><button class="support-older" type="button" data-copy-support-wechat>${tr('复制微信号','Copy WeChat ID')}</button><span data-support-copy-status role="status"></span><div>${tr('如需 WhatsApp 联系方式，请在这里向客服索取。','Ask us here for our WhatsApp contact details.')}</div></div>`;
  }
  function conversation(staff) {
    return `<div class="support-history" role="log" aria-live="polite">${staff ? '' : greeting()}</div><button class="support-older" type="button" hidden>${tr('更早的消息','Earlier messages')}</button><p class="support-status" role="status"></p><form class="support-compose"><textarea maxlength="2000" rows="2" required aria-label="${tr('消息','Message')}" placeholder="${tr('输入消息…','Type a message…')}"></textarea><button type="submit" class="button" title="${tr('发送','Send')}" aria-label="${tr('发送','Send')}">${icon('send')}</button></form>`;
  }
  function renderMessages(host, rows, customer, staff) {
    const log = host.querySelector('.support-history');
    const nearBottom = log.scrollHeight - log.scrollTop - log.clientHeight < 60;
    const html = rows.map(m => `<div class="support-message ${m.from_staff === staff ? 'mine' : ''}"><strong>${m.is_auto ? tr('客服 · 自动回复','Support · Automatic reply') : m.from_staff ? tr('客服','Support') : tr('客户','Customer')}</strong><div>${esc(m.body)}</div><time>${esc(date(m.created_at))}</time></div>`).join('') || `<p>${tr('还没有消息。','No messages yet.')}</p>`;
    const content = (staff ? '' : greeting()) + (rows.length || staff ? html : '');
    if (log.innerHTML !== content) {
      log.innerHTML = content;
      if (!staff && !log.dataset.loaded) log.scrollTop = 0;
      else if (nearBottom) log.scrollTop = log.scrollHeight;
    }
    log.dataset.loaded = 'true';
  }
  async function loadConversation(host, customer, staff, limit = Number(host.dataset.limit) || 100) {
    host.dataset.limit = limit;
    const token = revision;
    const status = host.querySelector('.support-status');
    try {
      const { data, error } = await context.db.from('support_messages').select('id,body,from_staff,is_auto,created_at').eq('customer_id', customer).order('id', { ascending:false }).limit(limit);
      if (token !== revision || !host.isConnected || (staff && selected !== customer)) return;
      if (error) throw error;
      renderMessages(host, [...data].reverse(), customer, staff);
      status.textContent = '';
      const older = host.querySelector('.support-older');
      older.hidden = data.length < limit;
      older.onclick = () => loadConversation(host, customer, staff, limit + 100);
      await context.db.rpc('support_mark_read', { p_customer:customer });
    } catch (_) { if (token === revision && host.isConnected) status.textContent = errorText(); }
  }
  function wire(host, customer, staff) {
    const form = host.querySelector('form'), input = form.querySelector('textarea'), button = form.querySelector('button');
    input.value = drafts.get(customer) || '';
    input.oninput = () => drafts.set(customer, input.value);
    form.onsubmit = async event => {
      event.preventDefault();
      if (busy || !input.value.trim()) return;
      const text = input.value.trim(), token = revision;
      busy = true; button.disabled = true; input.disabled = true;
      if (!pending || pending.customer !== customer || pending.text !== text) pending = {customer,text,id:crypto.randomUUID()};
      try {
        const { error } = await context.db.rpc('support_send', {p_customer:customer,p_body:text,p_request:pending.id,p_language:context.lang});
        if (error) throw error;
        if (token !== revision) return;
        pending = null; drafts.delete(customer); input.value = '';
        await loadConversation(host, customer, staff);
        const log = host.querySelector('.support-history'); log.scrollTop = log.scrollHeight;
      } catch (_) { if (token === revision) host.querySelector('.support-status').textContent = errorText(); }
      finally { busy = false; button.disabled = false; input.disabled = false; }
    };
    void loadConversation(host,customer,staff);
  }
  function fillPanel() {
    if (context.staff) {
      panel.querySelector('.support-body').innerHTML = `<button type="button" class="button" data-support-inbox>${tr('打开客服收件箱','Open support inbox')}</button>`;
      panel.querySelector('[data-support-inbox]').onclick = () => {setOpen(false); context.openInbox?.();};
      return;
    }
    panel.querySelector('.support-body').innerHTML = context.user
      ? conversation(false)
      : `<div class="support-history">${greeting()}</div><p>${tr('登录账户后，与客服沟通并查看回复。','Sign in to contact support and view replies.')}</p><button type="button" class="button" data-support-login>${tr('登录','Sign in')}</button>`;
    if (context.user) wire(panel, context.user, false);
    else panel.querySelector('[data-support-login]').onclick = () => { setOpen(false); document.querySelector('[data-open-account]')?.click(); };
    icons();
  }
  function setOpen(value) {
    opened = value; panel.hidden = !value;
    root.querySelector('.support-launcher').setAttribute('aria-expanded', String(value));
    if (value) {
      fillPanel(); panel.querySelector('textarea,button')?.focus();
      const token=revision;
      window.SupportSettings?.refresh(context.db,true).then(()=>{
        if(token!==revision || !opened || context.staff) return;
        const log=panel.querySelector('.support-history');
        if(log){log.querySelector('.support-greeting')?.remove();log.insertAdjacentHTML('afterbegin',greeting());}
      }).catch(()=>{});
    }
    else root.querySelector('.support-launcher').focus();
  }
  async function loadInbox() {
    if (!context.staff || !inbox || context.tab !== 'support' || !context.admin) return;
    const token = revision;
    try {
      const {data,error} = await context.db.rpc('support_inbox');
      if (token !== revision) return;
      if (error) throw error;
      inbox.querySelector('.support-inbox-status').textContent = '';
      const list = inbox.querySelector('.support-conversations');
      list.innerHTML = data.map(c => `<button type="button" data-customer="${esc(c.customer_id)}" class="${selected === c.customer_id ? 'selected' : ''}"><strong>${esc(c.customer_name)} ${c.unread ? `(${Number(c.unread)})` : ''}</strong><span>${esc(c.last_body)}</span><time>${esc(date(c.last_at))}</time></button>`).join('') || `<p>${tr('暂无客户消息','No customer messages')}</p>`;
      list.querySelectorAll('button').forEach(button => button.onclick = () => {
        selected = button.dataset.customer;
        const host = inbox.querySelector('.support-thread'); host.innerHTML = conversation(true); wire(host,selected,true); icons(); void loadInbox();
      });
    } catch (_) { if (token === revision) inbox.querySelector('.support-inbox-status').textContent = errorText(); }
  }
  window.renderSupportChat = next => {
    context = next;
    const key = `${next.user || ''}:${next.lang}:${next.staff}`;
    if (owner !== key) { owner = key; revision++; selected = ''; pending = null; drafts.clear(); root?.remove(); root = null; if (inbox) inbox.innerHTML = ''; inbox = null; }
    if (!root) {
      root = document.createElement('div'); root.id = 'supportChat';
      root.innerHTML = `<button class="support-launcher" type="button" aria-label="${tr('联系客服','Contact support')}" title="${tr('联系客服','Contact support')}" aria-expanded="false" aria-controls="supportChatPanel">${icon('message-circle')}</button><section id="supportChatPanel" role="dialog" aria-label="${tr('客服对话','Customer support')}" hidden><header><strong>${tr('客服','Customer support')}</strong><button type="button" data-support-expand title="${tr('放大或还原','Expand or restore')}" aria-label="${tr('放大或还原','Expand or restore')}" aria-pressed="false">${icon('maximize-2')}</button><button type="button" data-support-min title="${tr('缩小','Minimize')}" aria-label="${tr('缩小','Minimize')}">${icon('minus')}</button><button type="button" data-support-close title="${tr('关闭','Close')}" aria-label="${tr('关闭','Close')}">${icon('x')}</button></header><div class="support-body"></div></section>`;
      document.body.append(root); panel = root.querySelector('section');
      root.addEventListener('click', async event => {
        const button = event.target.closest('[data-copy-support-wechat]');
        if (!button) return;
        const status = button.parentElement.querySelector('[data-support-copy-status]');
        try {
          await navigator.clipboard.writeText(window.SupportSettings?.current.wechat || 'GoGoShop_NZ');
          status.textContent = tr('已复制','Copied');
        } catch (_) {
          status.textContent = tr('请长按或选中微信号复制','Select the WeChat ID above to copy it');
        }
      });
      root.querySelector('.support-launcher').onclick = () => setOpen(!opened);
      panel.querySelector('[data-support-min]').onclick = () => setOpen(false);
      panel.querySelector('[data-support-close]').onclick = () => {panel.classList.remove('expanded'); panel.querySelector('[data-support-expand]').setAttribute('aria-pressed','false'); setOpen(false);};
      panel.querySelector('[data-support-expand]').onclick = event => event.currentTarget.setAttribute('aria-pressed', String(panel.classList.toggle('expanded')));
      panel.onkeydown = event => {if(event.key === 'Escape') setOpen(false);};
      if (opened) setOpen(true); icons();
    }
    root.hidden = next.admin;
    const target = document.getElementById('supportInbox');
    if (next.staff && next.admin && next.tab === 'support' && target && target !== inbox) {
      inbox = target;
      inbox.innerHTML = `<div class="support-settings-host"></div><p class="support-inbox-status" role="status"></p><div class="support-inbox-layout"><div class="support-conversations"></div><div class="support-thread"><p>${tr('选择客户对话','Select a conversation')}</p></div></div>`;
      window.SupportSettings?.mount(inbox.querySelector('.support-settings-host'),context);
    }
    void loadInbox();
  };
  setInterval(() => {
    if (!context?.db || document.hidden) return;
    if (opened && !root.hidden && context.user && !context.staff) void loadConversation(panel,context.user,false);
    if (context.staff && context.admin && context.tab === 'support') {
      void loadInbox();
      if(selected && inbox?.querySelector('.support-history')) void loadConversation(inbox.querySelector('.support-thread'),selected,true);
    }
  },15000);
})();
