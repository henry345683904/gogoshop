const DEMO_ADDRESS = "0x5AaCd7f7aF55073bD11e8CCA63186aF40bF4E71d";
const STORAGE_KEY = "gogo-pocket-demo-v1";
const TOKEN_META = {
  GOGO: { name: "GoGo Coin", balance: 12580, decimals: 2, colorClass: "gogo-logo", mark: "G", nzd: 0.125 },
  BTC: { name: "Bitcoin", balance: 0, decimals: 8, colorClass: "btc-logo", mark: "₿", nzd: 156000 },
  ETH: { name: "Ethereum", balance: 1.8426, decimals: 4, colorClass: "eth-logo", mark: "♦", nzd: 6233.4 },
  USDT: { name: "模拟稳定币", balance: 52.18, decimals: 2, colorClass: "usdt-logo", mark: "₮", nzd: 1.682 }
};

const DEFAULT_STATE = {
  miner: { running: false, rate: 0.1, price: 0.125, earned: 0, lastAt: 0 },
  language: "zh",
  balances: { GOGO: 12580, BTC: 0, ETH: 1.8426, USDT: 52.18 },
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
      miner: { ...DEFAULT_STATE.miner, ...(parsed.miner || {}) },
      balances: { ...DEFAULT_STATE.balances, ...(parsed.balances || {}), ETH: parsed.balances?.ETH ?? parsed.balances?.BNB ?? DEFAULT_STATE.balances.ETH },
      activity: Array.isArray(parsed.activity) ? parsed.activity : DEFAULT_STATE.activity
    } : structuredClone(DEFAULT_STATE);
  } catch {
    return structuredClone(DEFAULT_STATE);
  }
}

function saveState() {
  localStorage.setItem(STORAGE_KEY, JSON.stringify(state));
}

function settingsModal() {
  settleMining();
  openModal("设置", `<form id="walletSettingsForm" class="sheet-body">
    <div class="field"><label for="language">语言</label><select id="language" name="language"><option value="zh" ${state.language !== "en" ? "selected" : ""}>简体中文</option><option value="en" ${state.language === "en" ? "selected" : ""}>English</option></select></div>
    ${Object.keys(TOKEN_META).map(symbol => `<div class="field"><label for="balance${symbol}">${symbol} 余额</label><input id="balance${symbol}" name="balance${symbol}" type="number" min="0" max="1000000000000000" step="any" value="${state.balances[symbol]}" required /></div>`).join("")}
    <div class="field"><label for="minerRateInput">矿机速率（GOGO/s）</label><input id="minerRateInput" name="minerRate" type="number" min="0" max="1000000000" step="any" value="${state.miner.rate}" required /></div>
    <div class="field"><label for="coinPriceInput">GOGO 单价（NZD）</label><input id="coinPriceInput" name="coinPrice" type="number" min="0" max="1000000000" step="any" value="${state.miner.price}" required /></div>
    <button type="submit" class="primary-button">保存设置</button>
  </form>`);
}

const languageNodes = new WeakMap();
const ENGLISH_COPY = {
  "钱包": "Wallet", "总资产（NZD）": "Total assets (NZD)", "今日": "Today", "转账": "Send", "收款": "Receive", "兑换": "Swap", "更多": "More", "资产": "Assets", "记录": "Activity", "行情": "Markets", "发现": "Discover", "我的": "Profile",
  "账户 1": "Account 1", "账户 2": "Account 2", "本地账户": "Local account", "简体中文": "Simplified Chinese", "设置": "Settings", "保存设置": "Save settings", "余额": "Balance", "语言": "Language", "网络": "Network", "稳定币": "Stablecoin", "本地资产": "Local asset", "安全中心": "Security", "不保存任何真实密钥": "No private keys stored", "关于本演示": "About this demo", "TokenPocket 风格界面": "TokenPocket-style interface", "重置数据": "Reset data",
  "市场": "Market", "市场总值": "Market capitalization", "关注列表": "Watchlist", "价格": "Prices", "演示入口": "Explore", "积分与代金券中心": "Rewards & vouchers", "体验 GOGO 在商城场景中的使用流程。": "Explore GOGO in the shop.", "打开商城": "Open shop", "常用功能": "Quick access", "全部为": "Demo features", "跨链桥": "Bridge", "网络资产互换": "Cross-network swap", "质押": "Staking", "收益中心": "Rewards", "数字藏品预览": "Collectibles", "投票": "Vote", "社区治理演示": "Community governance", "请勿输入真实钱包资料": "Do not enter wallet secrets", "本页没有真实 DApp、签名或链上授权功能。": "No live DApps, signatures or blockchain approvals.",
  "选择网络": "Select network", "BSC 网": "BSC Network", "Ethereum 网": "Ethereum Network", "Polygon 网": "Polygon Network", "仅切换界面，不连接节点": "Display only; no node connection", "收款地址": "Recipient address", "数量": "Amount", "全部": "Max", "仅本地": "Local only", "矿工费": "Network fee", "确认转账": "Confirm transfer", "输入 0x 开头的地址": "Enter a 0x address", "复制地址": "Copy address", "此二维码仅供界面演示，不可用于真实转账": "Display QR only. Not for real transfers.", "提示": "Note", "支付": "You pay", "获得": "You receive", "汇率：": "Rate: ", "价格影响": "Price impact", "网络费": "Network fee", "确认兑换": "Confirm swap", "更多功能": "More features", "添加 ETH 演示资产": "Add ETH demo asset", "移除 ETH 演示资产": "Remove ETH demo asset", "仅改变本页面显示": "Changes this page only", "地址簿": "Address book", "查看联系人": "View contacts", "授权检测": "Approval check", "此演示没有任何真实授权": "No blockchain approvals", "资产详情": "Asset details", "本地项目 · 未部署到公共网络": "Local project; not publicly deployed", "市场数据": "Market data", "估值": "Value", "暂无交易": "No transactions", "完成一次转账或兑换后会显示在这里": "Transfers and swaps appear here.", "刚刚": "Just now", "商城积分奖励": "Shop reward", "今天": "Today", "昨天": "Yesterday", "关闭": "Close", "复制地址": "Copy address", "切换网络": "Switch network", "扫描": "Scan", "隐藏余额": "Hide balance", "显示余额": "Show balance", "管理代币": "Manage tokens", "搜索": "Search", "收藏": "Favorites"
};
Object.assign(ENGLISH_COPY, {
  "可用": "Available", "请输入有效余额": "Enter a valid balance", "请输入有效的 0x 地址": "Enter a valid 0x address", "余额不足或数量无效": "Insufficient balance or invalid amount", "GOGO 余额不足": "Insufficient GOGO balance", "转账已完成，没有产生真实链上交易": "Transfer recorded locally. No blockchain transaction was sent.", "兑换完成": "Swap complete", "地址已复制": "Address copied", "地址簿为空": "Address book is empty", "检测完成：没有真实链上授权": "No blockchain approvals found", "账户 2 仅作界面展示": "Account 2 is for display only", "扫描功能仅作界面演示，不会调用摄像头": "Scanner preview; camera access is not requested", "行情为固定数据，不代表真实市场价格": "Prices are illustrative, not live market prices", "数据已重置": "Data reset", "已添加 ETH 演示资产": "ETH asset added", "已移除 ETH 演示资产": "ETH asset removed", "功能仅作界面演示": " is a demo feature", "页面仅作展示": " is a display-only page", "已切换至": "Switched to ", "本页面用于钱包界面体验。余额和交易保存在当前浏览器，不代表真实资产，不会发送链上交易。": "This is a wallet interface demo. Balances and activity are stored in this browser, represent no real assets, and do not send blockchain transactions."
});
Object.assign(ENGLISH_COPY, { "矿机速率（GOGO/s）": "Mining rate (GOGO/s)", "GOGO 单价（NZD）": "GOGO price (NZD)", "GOGO 矿机": "GOGO Miner", "矿机设置": "Miner settings", "累计产出": "Total mined", "产出价值": "Mined value", "GOGO 单价": "GOGO price", "每秒价值": "Value per second", "已暂停": "Paused", "运行中": "Running", "启动矿机": "Start mining", "暂停矿机": "Pause mining" });
const englishPhrases = Object.entries(ENGLISH_COPY).sort((a, b) => b[0].length - a[0].length);
const languageAttributes = new WeakMap();

function applyLanguage() {
  const clean = value => value.replaceAll("模拟", "").replaceAll("测试", "").replaceAll("Testnet", "Network");
  const translate = value => {
    let output = clean(value);
    if (state.language === "en") for (const [zh, en] of englishPhrases) output = output.split(zh).join(en);
    return output;
  };
  const walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT);
  while (walker.nextNode()) {
    const node = walker.currentNode;
    if (node.parentElement.closest("script, style")) continue;
    const cached = languageNodes.get(node);
    const original = cached && node.nodeValue === cached.output ? cached.original : node.nodeValue;
    const output = translate(original);
    languageNodes.set(node, { original, output });
    if (node.nodeValue !== output) node.nodeValue = output;
  }
  document.documentElement.lang = state.language === "en" ? "en" : "zh-CN";
  for (const element of document.querySelectorAll("[placeholder], [aria-label]")) {
    const cache = languageAttributes.get(element) || {};
    for (const attribute of ["placeholder", "aria-label"]) {
      if (!element.hasAttribute(attribute)) continue;
      const value = element.getAttribute(attribute);
      const entry = cache[attribute];
      const original = entry && value === entry.output ? entry.original : value;
      const output = translate(original);
      cache[attribute] = { original, output };
      element.setAttribute(attribute, output);
    }
    languageAttributes.set(element, cache);
  }
  document.querySelector('[data-profile-action="语言"] small').textContent = state.language === "en" ? "English" : "简体中文";
  document.title = state.language === "en" ? "GO GO Pocket · Wallet" : "GO GO Pocket · 钱包";
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
  applyLanguage();
  dom.toast.classList.add("is-visible");
  toastTimer = setTimeout(() => dom.toast.classList.remove("is-visible"), 2300);
}

function refreshIcons() {
  if (window.lucide) window.lucide.createIcons({ attrs: { "aria-hidden": "true" } });
  applyLanguage();
}

function updateBalances() {
  TOKEN_META.GOGO.nzd = state.miner.price;
  dom.gogoBalance.textContent = formatAmount(state.balances.GOGO, 2);
  dom.usdtBalance.textContent = formatAmount(state.balances.USDT, 2);
  for (const symbol of Object.keys(TOKEN_META)) {
    const row = document.querySelector(`[data-token="${symbol}"]`);
    row.querySelector(".token-balance strong").textContent = formatAmount(state.balances[symbol], TOKEN_META[symbol].decimals);
    row.querySelector(".token-balance small").textContent = `≈ NZ$${formatAmount(state.balances[symbol] * TOKEN_META[symbol].nzd)}`;
  }
  const total = Object.entries(TOKEN_META).reduce((sum, [symbol, meta]) => sum + state.balances[symbol] * meta.nzd, 0);
  dom.totalBalance.textContent = `NZ$${formatAmount(total, 2)}`;
  dom.app.classList.toggle("balance-hidden", state.hidden);
  dom.networkName.textContent = state.network;
  dom.toggleBalance.setAttribute("aria-label", state.hidden ? "显示余额" : "隐藏余额");
  dom.toggleBalance.innerHTML = `<i data-lucide="${state.hidden ? "eye-off" : "eye"}"></i>`;
  refreshIcons();
  renderMiner();
}

function settleMining() {
  const now = Date.now();
  const elapsed = state.miner.lastAt > 0 ? Math.max(0, (now - state.miner.lastAt) / 1000) : 0;
  if (state.miner.running) {
    const earned = elapsed * state.miner.rate;
    state.balances.GOGO += earned;
    state.miner.earned += earned;
  }
  state.miner.lastAt = now;
}

function miningNumber(value) {
  return Number(value).toLocaleString("en-NZ", { maximumFractionDigits: 8 });
}

function renderMiner() {
  document.getElementById("minerStatus").textContent = state.miner.running ? "运行中" : "已暂停";
  document.getElementById("minerRate").textContent = `${miningNumber(state.miner.rate)} GOGO/s`;
  document.getElementById("minerEarned").textContent = `${miningNumber(state.miner.earned)} GOGO`;
  document.getElementById("minerEarnedValue").textContent = `NZ$${miningNumber(state.miner.earned * state.miner.price)}`;
  document.getElementById("minerPrice").textContent = `NZ$${miningNumber(state.miner.price)}`;
  document.getElementById("minerValueRate").textContent = `NZ$${miningNumber(state.miner.rate * state.miner.price)}/s`;
  document.getElementById("toggleMiner").textContent = state.miner.running ? "暂停矿机" : "启动矿机";
  document.getElementById("miningMachine").classList.toggle("is-running", state.miner.running);
  document.querySelector(".market-row .gogo-logo").parentElement.querySelector("div:last-child strong").textContent = miningNumber(state.miner.price);
  applyLanguage();
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
      <div class="swap-box"><div class="swap-row"><span><small>获得</small><strong>USDT</strong></span><input id="swapOutput" value="${formatAmount(100 * state.miner.price / TOKEN_META.USDT.nzd, 4)}" aria-label="获得 USDT 数量" readonly /></div><small>模拟汇率：1 GOGO = ${miningNumber(state.miner.price / TOKEN_META.USDT.nzd)} USDT</small></div>
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
    <button class="more-option" type="button" data-more="balances"><span><i data-lucide="sliders-horizontal"></i></span><div><strong>设置</strong><small>余额</small></div><i data-lucide="chevron-right"></i></button>
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
  if (event.target.id === "walletSettingsForm") {
    event.preventDefault();
    const values = {};
    const rate = Number(event.target.elements.minerRate.value);
    const price = Number(event.target.elements.coinPrice.value);
    if (![rate, price].every(value => Number.isFinite(value) && value >= 0 && value <= 1e9)) return toast("请输入有效余额");
    for (const symbol of Object.keys(TOKEN_META)) {
      const value = Number(event.target.elements[`balance${symbol}`].value);
      if (!Number.isFinite(value) || value < 0 || value > 1e15) return toast("请输入有效余额");
      values[symbol] = value;
    }
    state.balances = values;
    state.miner.rate = rate;
    state.miner.price = price;
    state.miner.lastAt = Date.now();
    state.language = event.target.elements.language.value === "en" ? "en" : "zh";
    saveState(); updateBalances(); renderActivity(); closeModal(); toast(state.language === "en" ? "Settings saved" : "设置已保存");
    applyLanguage();
    return;
  }
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
    const output = amount * state.miner.price / TOKEN_META.USDT.nzd;
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
  if (more === "balances") settingsModal();
  if (more === "address") toast("模拟地址簿为空");
  if (more === "approval") toast("检测完成：没有真实链上授权");
  if (event.target.closest("[data-detail-action='send']")) sendModal();
  if (event.target.closest("[data-demo-account]")) toast("账户 2 仅作界面展示");
}

function copyAddress() {
  navigator.clipboard?.writeText(DEMO_ADDRESS).then(() => toast("模拟地址已复制")).catch(() => toast(DEMO_ADDRESS));
}

function bindEvents() {
  document.getElementById("minerSettings").addEventListener("click", settingsModal);
  document.getElementById("toggleMiner").addEventListener("click", () => {
    settleMining();
    state.miner.running = !state.miner.running;
    saveState(); updateBalances();
  });
  window.addEventListener("pagehide", () => { settleMining(); saveState(); });
  document.querySelector('[aria-label="设置"]').addEventListener("click", settingsModal);
  document.querySelectorAll("[data-nav]").forEach((button) => button.addEventListener("click", () => showView(button.dataset.nav)));
  document.querySelectorAll("[data-action]").forEach((button) => button.addEventListener("click", () => {
    ({ send: sendModal, receive: receiveModal, swap: swapModal, more: moreModal })[button.dataset.action]?.();
  }));
  document.querySelectorAll("[data-token]").forEach((button) => button.addEventListener("click", () => assetDetailModal(button.dataset.token)));
  document.querySelectorAll("[data-demo-feature]").forEach((button) => button.addEventListener("click", () => toast(`${button.dataset.demoFeature}功能仅作界面演示`)));
  document.querySelectorAll("[data-profile-action]").forEach((button) => button.addEventListener("click", () => {
    const action = button.dataset.profileAction;
    if (action === "网络") return networkModal();
    if (action === "语言") return settingsModal();
    if (action === "关于") return openModal("关于本演示", "<p>本页面用于钱包界面体验。余额和交易保存在当前浏览器，不代表真实资产，不会发送链上交易。</p>");
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
    if (event.target.id === "swapAmount") document.getElementById("swapOutput").value = formatAmount(Number(event.target.value || 0) * state.miner.price / TOKEN_META.USDT.nzd, 4);
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
  settleMining();
  updateBalances();
  renderActivity();
  refreshIcons();
  setInterval(() => {
    if (!dom.modalBackdrop.hidden) return;
    settleMining(); saveState(); updateBalances();
  }, 1000);
}

document.addEventListener("DOMContentLoaded", init);
