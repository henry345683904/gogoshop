(function () {
  const storageKey = (userId) => `gogoshop-bank-deposits-${userId || "admin"}`;
  const money = (value) => new Intl.NumberFormat("en-NZ", { style: "currency", currency: "NZD" }).format(Number(value) || 0);
  const today = () => new Date().toISOString().slice(0, 10);

  function read(userId) {
    try {
      const value = JSON.parse(localStorage.getItem(storageKey(userId)) || "[]");
      return Array.isArray(value) ? value.filter((item) => item && item.date && Number(item.amount) > 0) : [];
    } catch (_) { return []; }
  }

  function render(allowed, language, userId) {
    const root = document.getElementById("bankDepositTracker");
    if (!root) return;
    root.hidden = !allowed;
    if (!allowed) return;
    const zh = language === "zh";
    const records = read(userId).sort((a, b) => String(b.date).localeCompare(String(a.date)));
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
    root.querySelector("[data-bank-deposit-form]").addEventListener("submit", (event) => {
      event.preventDefault();
      const form = event.currentTarget;
      const amount = Number(form.amount.value);
      if (!(amount > 0) || !form.date.value) return;
      const next = read(userId);
      next.push({ id: `${Date.now()}-${Math.random().toString(36).slice(2)}`, amount: Math.round(amount * 100) / 100, date: form.date.value });
      localStorage.setItem(storageKey(userId), JSON.stringify(next));
      render(allowed, language, userId);
    });
    root.querySelectorAll("[data-bank-deposit-delete]").forEach((button) => button.addEventListener("click", () => {
      const next = read(userId).filter((item) => item.id !== button.dataset.bankDepositDelete);
      localStorage.setItem(storageKey(userId), JSON.stringify(next));
      render(allowed, language, userId);
    }));
  }

  window.renderBankDepositTracker = render;
})();
