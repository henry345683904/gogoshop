const DEMO_ADDRESS = "0x5AaCd7f7aF55073bD11e8CCA63186aF40bF4E71d";
const STORAGE_KEY = "gogo-pocket-demo-v1";
const TOKEN_META = {
  GOGO: { name: "GoGo Coin", balance: 12580, decimals: 2, colorClass: "gogo-logo", mark: "G", nzd: 0.125 },
  BNB: { name: "BNB Testnet", balance: 1.8426, decimals: 4, colorClass: "bnb-logo", mark: "◆", nzd: 643.78 },
  USDT: { name: "模拟稳定币", balance: 52.18, decimals: 2, colorClass: "usdt-logo", mark: "₮", nzd: 1.682 }
};

const DEFAULT_STATE = {
  balances: { GOGO: 12580, BNB: 1.8426, USDT: 52.18 },
  hidden: false,
  extraToken: false,
  network: "BSC 测试网",
  activity: [
    { type: "receive", token: "GOGO", amount: 500, peer: "商城积分奖励", time: "今天 10:24" },
    { type: "swap", token: "USDT", amount: 18.5, peer: "GOGO → USDT", time: "昨天 18:42" },
    { type: "send", token: "BNB", amount: 0.08, peer: "0x8a21...4D92", time: "11月24日" }
  ]
};

const state = loadState();
const dom = {};
let toastTimer = null;

function loadState() {
  try {
    const parsed = JSON.parse(localStorage.getItem(STORAGE_KEY));
    return parsed ? {
      ...structuredClone(DEFAULT_STATE),
      ...parsed,
      balances: { ...DEFAULT_STATE.balances, ...(parsed.balances || {}) },
      activity: Array.isArray(parsed.activity) ? parsed.activity : DEFAULT_STATE.activity
    } : structuredClone(DEFAULT_STATE);
  } catch {
    return structuredClone(DEFAULT_STATE);
  }
}

function saveState() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
}

function formatAmount(value, decimals = 2) {
  return Number(value).toLocaleString("en-NZ", { minimumFractionDigits: decimals, maximumFractionDigits: decimals });
}

function shortAddress(address = DEMO_ADDRESS) {
  return `${address.slice(0, 6)}...${address.slice(-4)}`;
}

function toast(message) {
  clearTimeout(toastTimer);
  dom.toast.textContent = message;
  dom.toast.classList.add("is-visible");
  toastTimer = setTimeout(() => dom.toast.classList.remove("is-visible"), 2300);
}

function refreshIcons() {
  if (window.lucide) window.lucide.createIcons({ attrs: { "aria-hidden": "true" } });
}

function updateBalances() {
  dom.gogoBalance.textContent = formatAmount(state.balances.GOGO, 2);
  dom.bnbBalance.textContent = formatAmount(state.balances.BNB, 4);
  dom.usdtBalance.textContent = formatAmount(state.balances.USDT, 2);
  const total = state.balances.GOGO * TOKEN_META.GOGO.nzd + state.balances.BNB * TOKEN_META.BNB.nzd + state.balances.USDT * TOKEN_META.USDT.nzd + (state.extraToken ? 149.6 : 0);
  dom.totalBalance.textContent = `NZ$${formatAmount(total, 2)}`;
  dom.app.classList.toggle("balance-hidden", state.hidden);
  dom.ethRow.hidden = !state.extraToken;
  dom.networkName.textContent = state.network;
  dom.toggleBalance.setAttribute("aria-label", state.hidden ? "显示余额" : "隐藏余额");
  dom.toggleBalance.innerHTML = `<i data-lucide="${state.hidden ? "eye-off" : "eye"}"></i>`;
  refreshIcons();
}

function renderActivity() {
  if (!state.activity.length) {
    dom.activityList.innerHTML = `<div class="empty-state"><i data-lucide="receipt-text"></i><strong>暂无模拟交易</strong><small>完成一次转账或兑换后会显示在这里</small></div>`;
    refreshIcons();
    return;
  }
  dom.activityList.innerHTML = state.activity.map((item) => {
    const incoming = item.type === "receive";
    const icon = item.type === "swap" ? "repeat-2" : incoming ? "arrow-down-left" : "arrow-up-right";
    const title = item.type === "swap" ? "模拟兑换" : incoming ? "模拟收款" : "模拟转账";
    const sign = incoming ? "+" : item.type === "send" ? "-" : "";
    return `<article class="activity-item">
      <span><i data-lucide="${icon}"></i></span>
      <div><strong>${title}</strong><small>${item.peer} · ${item.time}</small></div>
      <strong class="activity-amount ${incoming ? "positive" : item.type === "send" ? "negative" : ""}">${sign}${formatAmount(item.amount, item.token === "BNB" ? 4 : 2)} ${item.token}</strong>
    </article>`;
  }).join("");
  refreshIcons();
}

function showView(name) {
  document.querySelectorAll(".view").forEach((view) => {
    const active = view.dataset.view === name;
    view.hidden = !active;
    view.classList.toggle("is-active", active);
  });
  document.querySelectorAll("[data-nav]").forEach((button) => button.classList.toggle("is-active", button.dataset.nav === name));
  window.scrollTo({ top: 0, behavior: "smooth" });
}

function openModal(title, html) {
  dom.modalTitle.textContent = title;
  dom.modalBody.innerHTML = html;
  dom.modalBackdrop.hidden = false;
  document.body.style.overflow = "hidden";
  refreshIcons();
}

function closeModal() {
  dom.modalBackdrop.hidden = true;
  document.body.style.removeProperty("overflow");
}

function sendModal() {
  openModal("模拟转账", `
    <div class="asset-pill"><span class="token-logo gogo-logo">G</span><div><strong>GOGO</strong><small>可用 ${formatAmount(state.balances.GOGO)} GOGO</small></div></div>
    <form id="sendForm" class="sheet-body">
      <div class="field"><label for="sendAddress">收款地址</label><input id="sendAddress" name="address" inputmode="text" placeholder="输入 0x 开头的模拟地址" autocomplete="off" required /></div>
      <div class="field"><label for="sendAmount">数量</label><input id="sendAmount" name="amount" inputmode="decimal" type="number" min="0.01" step="0.01" placeholder="0.00" required /><div class="field-hint"><span>仅本地模拟</span><button type="button" id="sendMaxButton">全部</button></div></div>
      <div class="summary-box"><div><span>网络</span><strong>${state.network}</strong></div><div><span>模拟矿工费</span><strong>0.0005 tBNB</strong></div></div>
      <button class="primary-button" type="submit">确认模拟转账</button>
    </form>`);
}

function receiveModal() {
  const pattern = Array.from({ length: 169 }, (_, index) => {
    const row = Math.floor(index / 13);
    const col = index % 13;
    const finder = (row < 4 && col < 4) || (row < 4 && col > 8) || (row > 8 && col < 4);
    const on = finder || ((row * 7 + col * 11 + row * col) % 5 < 2);
    return `<i class="${on ? "" : "off"}"></i>`;
  }).join("");
  openModal("模拟收款", `
    <div class="qr-wrap"><div class="qr-code" aria-label="模拟二维码，不可用于真实转账">${pattern}</div><strong>账户 1 · ${state.network}</strong><p>${DEMO_ADDRESS}</p></div>
    <button class="primary-button" id="copyReceiveAddress" type="button"><i data-lucide="copy"></i> 复制模拟地址</button>
    <div class="summary-box"><div><span>提示</span><strong>此二维码仅供界面演示，不可用于真实转账</strong></div></div>`);
}

function swapModal() {
  openModal("模拟兑换", `
    <form id="swapForm" class="sheet-body">
      <div class="swap-box"><div class="swap-row"><span><small>支付</small><strong>GOGO</strong></span><input id="swapAmount" type="number" min="1" step="1" value="100" aria-label="支付 GOGO 数量" /></div><small>余额 ${formatAmount(state.balances.GOGO)} GOGO</small></div>
      <div class="swap-divider"><i data-lucide="arrow-down"></i></div>
      <div class="swap-box"><div class="swap-row"><span><small>获得</small><strong>USDT</strong></span><input id="swapOutput" value="7.4316" aria-label="获得 USDT 数量" readonly /></div><small>模拟汇率：1 GOGO = 0.074316 USDT</small></div>
      <div class="summary-box"><div><span>价格影响</span><strong>&lt; 0.01%</strong></div><div><span>网络费</span><strong>0.0008 tBNB</strong></div></div>
      <button class="primary-button" type="submit">确认模拟兑换</button>
    </form>`);
}

function networkModal() {
  const networks = ["BSC 测试网", "Ethereum 测试网", "Polygon 测试网"];
  openModal("选择模拟网络", `<div class="network-list">${networks.map((network) => `
    <button class="network-option ${state.network === network ? "is-selected" : ""}" type="button" data-network="${network}">
      <span><i data-lucide="network"></i></span><div><strong>${network}</strong><small>仅切换界面，不连接节点</small></div><i data-lucide="${state.network === network ? "circle-check" : "chevron-right"}"></i>
    </button>`).join("")}</div>`);
}

function moreModal() {
  openModal("更多模拟功能", `<div class="more-list">
    <button class="more-option" type="button" data-more="token"><span><i data-lucide="circle-plus"></i></span><div><strong>${state.extraToken ? "移除 ETH 演示资产" : "添加 ETH 演示资产"}</strong><small>仅改变本页面显示</small></div><i data-lucide="chevron-right"></i></button>
    <button class="more-option" type="button" data-more="address"><span><i data-lucide="contact-round"></i></span><div><strong>地址簿</strong><small>查看模拟联系人</small></div><i data-lucide="chevron-right"></i></button>
    <button class="more-option" type="button" data-more="approval"><span><i data-lucide="file-check-2"></i></span><div><strong>授权检测</strong><small>此演示没有任何真实授权</small></div><i data-lucide="chevron-right"></i></button>
  </div>`);
}

function assetDetailModal(symbol) {
  const meta = TOKEN_META[symbol];
  if (!meta) return;
  const balance = state.balances[symbol];
  openModal(`${symbol} 资产详情`, `<div class="asset-detail">
    <span class="token-logo ${meta.colorClass}">${meta.mark}</span><h3>${meta.name}</h3><small>${symbol === "GOGO" ? "本地测试项目 · 未部署到公共网络" : "模拟市场数据"}</small>
    <div class="detail-balance">${formatAmount(balance, meta.decimals)} ${symbol}</div>
    <div class="detail-chart" aria-label="模拟价格走势图"><i></i><i></i><i></i><i></i><i></i><i></i><i></i><i></i></div>
    <div class="summary-box"><div><span>模拟估值</span><strong>NZ$${formatAmount(balance * meta.nzd, 2)}</strong></div><div><span>24h</span><strong class="positive">+2.18%</strong></div><div><span>网络</span><strong>${state.network}</strong></div></div>
    <button class="primary-button" type="button" data-detail-action="send">模拟转账</button>
  </div>`);
}

function accountModal() {
  openModal("模拟账户", `<div class="network-list">
    <button class="network-option is-selected" type="button"><span class="avatar">A1</span><div><strong>账户 1</strong><small>${shortAddress()}</small></div><i data-lucide="circle-check"></i></button>
    <button class="network-option" type="button" data-demo-account="2"><span class="avatar">A2</span><div><strong>账户 2</strong><small>尚未创建 · 仅界面演示</small></div><i data-lucide="chevron-right"></i></button>
  </div>`);
}

function handleSubmit(event) {
  if (event.target.id === "sendForm") {
    event.preventDefault();
    const address = event.target.address.value.trim();
    const amount = Number(event.target.amount.value);
    if (!/^0x[a-fA-F0-9]{40}$/.test(address)) return toast("请输入有效的 0x 模拟地址");
    if (!amount || amount <= 0 || amount > state.balances.GOGO) return toast("模拟余额不足或数量无效");
    state.balances.GOGO -= amount;
    state.activity.unshift({ type: "send", token: "GOGO", amount, peer: shortAddress(address), time: "刚刚" });
    saveState(); updateBalances(); renderActivity(); closeModal(); toast("模拟转账已完成，没有产生真实链上交易");
  }
  if (event.target.id === "swapForm") {
    event.preventDefault();
    const amount = Number(document.getElementById("swapAmount").value);
    if (!amount || amount <= 0 || amount > state.balances.GOGO) return toast("GOGO 模拟余额不足");
    const output = amount * 0.074316;
    state.balances.GOGO -= amount;
    state.balances.USDT += output;
    state.activity.unshift({ type: "swap", token: "USDT", amount: output, peer: `${formatAmount(amount, 2)} GOGO → USDT`, time: "刚刚" });
    saveState(); updateBalances(); renderActivity(); closeModal(); toast("模拟兑换完成");
  }
}

function handleModalClick(event) {
  if (event.target.closest("#copyReceiveAddress")) copyAddress();
  if (event.target.closest("#sendMaxButton")) document.getElementById("sendAmount").value = Math.floor(state.balances.GOGO * 100) / 100;
  const network = event.target.closest("[data-network]")?.dataset.network;
  if (network) { state.network = network; saveState(); updateBalances(); closeModal(); toast(`已切换至 ${network}（模拟）`); }
  const more = event.target.closest("[data-more]")?.dataset.more;
  if (more === "token") { state.extraToken = !state.extraToken; saveState(); updateBalances(); closeModal(); toast(state.extraToken ? "已添加 ETH 演示资产" : "已移除 ETH 演示资产"); }
  if (more === "address") toast("模拟地址簿为空");
  if (more === "approval") toast("检测完成：没有真实链上授权");
  if (event.target.closest("[data-detail-action='send']")) sendModal();
  if (event.target.closest("[data-demo-account]")) toast("账户 2 仅作界面展示");
}

function copyAddress() {
  navigator.clipboard?.writeText(DEMO_ADDRESS).then(() => toast("模拟地址已复制")).catch(() => toast(DEMO_ADDRESS));
}

function bindEvents() {
  document.querySelectorAll("[data-nav]").forEach((button) => button.addEventListener("click", () => showView(button.dataset.nav)));
  document.querySelectorAll("[data-action]").forEach((button) => button.addEventListener("click", () => {
    ({ send: sendModal, receive: receiveModal, swap: swapModal, more: moreModal })[button.dataset.action]?.();
  }));
  document.querySelectorAll("[data-token]").forEach((button) => button.addEventListener("click", () => assetDetailModal(button.dataset.token)));
  document.querySelectorAll("[data-demo-feature]").forEach((button) => button.addEventListener("click", () => toast(`${button.dataset.demoFeature}功能仅作界面演示`)));
  document.querySelectorAll("[data-profile-action]").forEach((button) => button.addEventListener("click", () => {
    const action = button.dataset.profileAction;
    if (action === "网络") return networkModal();
    toast(`${action}页面仅作模拟展示`);
  }));
  document.querySelectorAll("[data-asset-tab]").forEach((button) => button.addEventListener("click", () => {
    const activity = button.dataset.assetTab === "activity";
    document.querySelectorAll("[data-asset-tab]").forEach((item) => item.classList.toggle("is-active", item === button));
    dom.assetList.hidden = activity;
    dom.activityList.hidden = !activity;
  }));
  dom.toggleBalance.addEventListener("click", () => { state.hidden = !state.hidden; saveState(); updateBalances(); });
  dom.copyAddressButton.addEventListener("click", copyAddress);
  dom.accountButton.addEventListener("click", accountModal);
  dom.networkButton.addEventListener("click", networkModal);
  dom.scanButton.addEventListener("click", () => toast("扫描功能仅作界面演示，不会调用摄像头"));
  dom.manageTokensButton.addEventListener("click", moreModal);
  dom.marketInfoButton.addEventListener("click", () => toast("行情为固定模拟数据，不代表真实市场价格"));
  dom.closeModal.addEventListener("click", closeModal);
  dom.modalBackdrop.addEventListener("click", (event) => { if (event.target === dom.modalBackdrop) closeModal(); });
  dom.modalBody.addEventListener("click", handleModalClick);
  dom.modalBody.addEventListener("submit", handleSubmit);
  dom.modalBody.addEventListener("input", (event) => {
    if (event.target.id === "swapAmount") document.getElementById("swapOutput").value = formatAmount(Number(event.target.value || 0) * 0.074316, 4);
  });
  dom.resetDemoButton.addEventListener("click", () => {
    Object.assign(state, structuredClone(DEFAULT_STATE)); saveState(); updateBalances(); renderActivity(); toast("模拟数据已重置");
  });
  window.addEventListener("keydown", (event) => { if (event.key === "Escape" && !dom.modalBackdrop.hidden) closeModal(); });
}

function init() {
  ["app", "toast", "totalBalance", "gogoBalance", "bnbBalance", "usdtBalance", "ethRow", "networkName", "toggleBalance", "copyAddressButton", "accountButton", "networkButton", "scanButton", "manageTokensButton", "marketInfoButton", "assetList", "activityList", "modalBackdrop", "modalTitle", "modalBody", "closeModal", "resetDemoButton"].forEach((id) => {
    dom[id] = id === "app" ? document.querySelector(".wallet-app") : document.getElementById(id);
  });
  bindEvents();
  updateBalances();
  renderActivity();
  refreshIcons();
}

document.addEventListener("DOMContentLoaded", init);
