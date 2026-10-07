(function () {
  const storageKey = (userId) => `gogoshop-bank-deposits-${userId || "admin"}`;
  const money = (value) => new Intl.NumberFormat("en-NZ", { style: "currency", currency: "NZD" }).format(Number(value) || 0);
  const today = () => new Date().toISOString().slice(0, 10);
  let currentUser = null;
  let recordsCache = [];
  let loading = false;
  let ready = false;
  let errorMessage = "";
  let lastLoaded = 0;
  let writing = false;
  const escape = value => String(value ?? "").replace(/[&<>"']/g, c => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));

  async function request(query) {
    let timer;
    try {
      const result = await Promise.race([query, new Promise((_, reject) => {
        timer = setTimeout(() => reject(new Error('Connection timed out. Please retry.')), 15000);
      })]);
      if (result.error) throw result.error;
      return result.data;
    } finally { clearTimeout(timer); }
  }

  async function refresh(allowed, language, userId, db) {
    if (loading || writing || !db) return;
    loading = true;
    errorMessage = "";
    try {
      const legacy = read(userId);
      if (legacy.length) {
        // Stable legacy IDs and retained tombstones prevent duplicate imports.
        await request(db.from('bank_deposits').upsert(legacy.map(item => ({
          id: `legacy:${userId}:${item.id}`, amount: Number(item.amount), date: item.date, created_by: userId
        })), { onConflict: 'id', ignoreDuplicates: true }));
      }
      const rows = [];
      for (let offset = 0; ; offset += 500) {
        const page = await request(db.from('bank_deposits').select('id,amount,date')
          .is('deleted_at', null).order('date', { ascending: false }).order('id').range(offset, offset + 499));
        rows.push(...page);
        if (page.length < 500) break;
      }
      if (currentUser !== userId) return;
      recordsCache = rows;
      ready = true;
      lastLoaded = Date.now();
    } catch (error) {
      if (currentUser === userId) errorMessage = error.message || String(error);
    } finally {
      loading = false;
      if (currentUser === userId) render(allowed, language, userId, db, true);
    }
  }

  function read(userId) {
    try {
      const value = JSON.parse(localStorage.getItem(storageKey(userId)) || "[]");
      return Array.isArray(value) ? value.filter((item) => item && item.date && Number(item.amount) > 0) : [];
    } catch (_) { return []; }
  }

  function render(allowed, language, userId, db, skipRefresh = false) {
    const root = document.getElementById("bankDepositTracker");
    if (!root) return;
    root.hidden = !allowed;
    if (!allowed) { currentUser = null; recordsCache = []; ready = false; return; }
    if (currentUser !== userId) {
      currentUser = userId; recordsCache = []; ready = false; errorMessage = ""; lastLoaded = 0;
    }
    if (!skipRefresh && !loading && !writing && Date.now() - lastLoaded > 30000 && !errorMessage) {
      void refresh(allowed, language, userId, db);
    }
    const activeForm = root.querySelector('[data-bank-deposit-form]');
    if (activeForm && (writing || (!skipRefresh && activeForm.contains(document.activeElement)))) return;
    const draft = activeForm ? { amount: activeForm.amount.value, date: activeForm.date.value, id: activeForm.dataset.depositId } : null;
    const zh = language === "zh";
    const records = recordsCache;
    const total = records.reduce((sum, item) => sum + Number(item.amount), 0);
    root.innerHTML = `<style>
      #bankDepositTracker[hidden]{display:none!important}
      #bankDepositTracker{border-top:1px solid #ddd;padding:20px 0;margin:20px 0}
      #bankDepositTracker h2{font-size:20px;margin:0 0 6px}
      #bankDepositTracker .bank-deposit-head{display:flex;justify-content:space-between;gap:16px;align-items:flex-start}
      #bankDepositTracker .bank-deposit-form{display:grid;grid-template-columns:minmax(0,1fr) minmax(0,1fr) auto;gap:12px;align-items:end;margin:16px 0}
      #bankDepositTracker label{display:grid;gap:6px;font-size:13px}
      #bankDepositTracker input{width:100%;min-width:0;min-height:40px;border:1px solid #bbb;border-radius:4px;padding:8px;font:inherit;background:#fff;color:#222;box-sizing:border-box}
      #bankDepositTracker .bank-deposit-total{font-size:18px;font-weight:700;white-space:nowrap}
      #bankDepositTracker .bank-deposit-history{overflow:auto}
      #bankDepositTracker table{width:100%;border-collapse:collapse;font-size:13px}
      #bankDepositTracker td,#bankDepositTracker th{padding:9px 8px;border-bottom:1px solid #ddd;text-align:left;white-space:nowrap}
      #bankDepositTracker th:last-child,#bankDepositTracker td:last-child{text-align:right}
      #bankDepositTracker .bank-deposit-delete{border:0;background:transparent;color:#8c2d20;cursor:pointer;padding:4px 0}
      @media(max-width:650px){#bankDepositTracker .bank-deposit-head{display:block}#bankDepositTracker .bank-deposit-form{grid-template-columns:1fr 1fr}#bankDepositTracker .bank-deposit-form button{grid-column:1/-1}}
    </style>
    <div class="bank-deposit-head"><div><h2>${zh ? "现金存入公司银行卡" : "Cash bank deposits"}</h2><span class="muted">${zh ? "记录从线下现金收入存入公司银行卡的金额和日期" : "Record cash transferred from offline takings to the company bank account"}</span></div><strong class="bank-deposit-total">${zh ? "累计" : "Total"} ${money(total)}</strong></div>
    <form class="bank-deposit-form" data-bank-deposit-form><label>${zh ? "存款金额 (NZD)" : "Deposit amount (NZD)"}<input type="number" min="0.01" step="0.01" inputmode="decimal" name="amount" required placeholder="0.00"></label><label>${zh ? "存款日期" : "Deposit date"}<input type="date" name="date" value="${today()}" required></label><button class="button" type="submit">${zh ? "保存存款" : "Save deposit"}</button></form>
    <div class="bank-deposit-history">${records.length ? `<table><thead><tr><th>${zh ? "日期" : "Date"}</th><th>${zh ? "金额" : "Amount"}</th><th>${zh ? "操作" : "Action"}</th></tr></thead><tbody>${records.map((item) => `<tr><td>${item.date}</td><td>${money(item.amount)}</td><td><button class="bank-deposit-delete" type="button" data-bank-deposit-delete="${item.id}">${zh ? "删除" : "Delete"}</button></td></tr>`).join("")}</tbody></table>` : `<span class="muted">${zh ? "还没有存款记录" : "No deposit records yet"}</span>`}</div>`;
    root.insertAdjacentHTML('beforeend', `<p role="status">${escape(errorMessage ? (zh ? '云端同步失败，旧记录仍保留：' : 'Cloud sync failed; local records are retained: ') + errorMessage : !ready ? (zh ? '正在同步存款记录…' : 'Syncing deposits…') : (zh ? '已从云端同步' : 'Synced with cloud'))}</p><button class="button ghost" type="button" data-deposit-refresh>${zh ? '刷新' : 'Refresh'}</button>`);
    root.querySelector('[data-deposit-refresh]').onclick = () => { void refresh(allowed, language, userId, db); };
    const depositForm = root.querySelector('[data-bank-deposit-form]');
    if (draft) { depositForm.amount.value = draft.amount; depositForm.date.value = draft.date; if (draft.id) depositForm.dataset.depositId = draft.id; }
    depositForm.querySelector('button').disabled = !ready || !db;
    root.querySelector("[data-bank-deposit-form]").addEventListener("submit", async (event) => {
      event.preventDefault();
      const form = event.currentTarget;
      const amount = Number(form.amount.value);
      if (!(amount > 0) || !form.date.value) return;
      if (writing || !ready || !db) return;
      writing = true;
      form.querySelector('button').disabled = true;
      form.dataset.depositId ||= crypto.randomUUID();
      try {
        await request(db.from('bank_deposits').upsert({ id: form.dataset.depositId, amount: Math.round(amount * 100) / 100, date: form.date.value, created_by: userId }, { onConflict: 'id', ignoreDuplicates: true }));
        form.amount.value = '';
        delete form.dataset.depositId;
        errorMessage = '';
      } catch (error) { errorMessage = error.message || String(error); }
      writing = false;
      if (!errorMessage) await refresh(allowed, language, userId, db);
      else render(allowed, language, userId, db, true);
    });
    root.querySelectorAll("[data-bank-deposit-delete]").forEach((button) => button.addEventListener("click", async () => {
      if (writing || !db) return;
      writing = true; button.disabled = true;
      try {
        await request(db.from('bank_deposits').update({ deleted_at: new Date().toISOString() }).eq('id', button.dataset.bankDepositDelete).select('id').single());
        errorMessage = '';
      } catch (error) { errorMessage = error.message || String(error); }
      writing = false;
      if (!errorMessage) await refresh(allowed, language, userId, db);
      else render(allowed, language, userId, db, true);
    }));
  }

  window.renderBankDepositTracker = render;
})();
