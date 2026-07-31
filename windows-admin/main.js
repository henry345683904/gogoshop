const { app, BrowserWindow, Menu, shell, session, ipcMain } = require("electron");
const path = require("node:path");

const SITE_ORIGIN = "https://gogoshop.nz";
const SITE_URL = `${SITE_ORIGIN}/?app=windows-admin`;
const ALLOWED_SITE_HOSTS = new Set(["gogoshop.nz", "www.gogoshop.nz"]);
const AUTH_HOSTS = new Set([
  "accounts.google.com",
  "appleid.apple.com",
  "checkout.stripe.com",
  "js.stripe.com"
]);

let mainWindow;

function isHttpUrl(value) {
  try {
    const url = new URL(value);
    return url.protocol === "http:" || url.protocol === "https:";
  } catch {
    return false;
  }
}

function isInternalUrl(value) {
  try {
    return ALLOWED_SITE_HOSTS.has(new URL(value).hostname);
  } catch {
    return false;
  }
}

function isAuthUrl(value) {
  try {
    return AUTH_HOSTS.has(new URL(value).hostname);
  } catch {
    return false;
  }
}

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 1440,
    height: 920,
    minWidth: 1080,
    minHeight: 700,
    show: false,
    title: "GO GO SHOP Manager",
    icon: path.join(__dirname, "assets", "gogoshop.png"),
    backgroundColor: "#f6f6f7",
    webPreferences: {
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true,
      preload: path.join(__dirname, "preload.js"),
      partition: "persist:gogoshop-manager"
    }
  });

  mainWindow.once("ready-to-show", () => mainWindow.show());
  mainWindow.on("closed", () => {
    mainWindow = null;
  });

  mainWindow.webContents.setWindowOpenHandler(({ url }) => {
    if (isInternalUrl(url) || isAuthUrl(url)) {
      return {
        action: "allow",
        overrideBrowserWindowOptions: {
          width: 1100,
          height: 800,
          autoHideMenuBar: true,
          webPreferences: {
            contextIsolation: true,
            nodeIntegration: false,
            sandbox: true,
            partition: "persist:gogoshop-manager"
          }
        }
      };
    }
    if (isHttpUrl(url)) shell.openExternal(url);
    return { action: "deny" };
  });

  mainWindow.webContents.on("will-navigate", (event, url) => {
    if (isInternalUrl(url) || isAuthUrl(url)) return;
    if (isHttpUrl(url)) {
      event.preventDefault();
      shell.openExternal(url);
    }
  });

  mainWindow.loadURL(`${SITE_URL}#admin`);
}

async function refreshFromServer() {
  if (!mainWindow || mainWindow.isDestroyed()) return;
  await session.fromPartition("persist:gogoshop-manager").clearCache();
  mainWindow.webContents.reloadIgnoringCache();
}

function navigateTo(hash) {
  if (!mainWindow || mainWindow.isDestroyed()) return;
  mainWindow.loadURL(`${SITE_URL}${hash}`);
}

function buildMenu() {
  const template = [
    {
      label: "GO GO SHOP",
      submenu: [
        { label: "Open Admin", accelerator: "CmdOrCtrl+2", click: () => navigateTo("#admin") },
        { label: "Open Storefront", accelerator: "CmdOrCtrl+1", click: () => navigateTo("#home") },
        { type: "separator" },
        { label: "Check for website updates", accelerator: "CmdOrCtrl+Shift+R", click: refreshFromServer },
        { type: "separator" },
        { role: "quit" }
      ]
    },
    {
      label: "View",
      submenu: [
        { role: "reload" },
        { role: "toggleDevTools", visible: !app.isPackaged },
        { type: "separator" },
        { role: "resetZoom" },
        { role: "zoomIn" },
        { role: "zoomOut" }
      ]
    },
    {
      label: "Help",
      submenu: [
        { label: "Open gogoshop.nz", click: () => shell.openExternal(SITE_ORIGIN) }
      ]
    }
  ];
  Menu.setApplicationMenu(Menu.buildFromTemplate(template));
}

app.whenReady().then(() => {
  app.setAppUserModelId("nz.gogoshop.manager");
  ipcMain.on("gogo-open-admin", () => navigateTo("#admin"));
  ipcMain.on("gogo-open-storefront", () => navigateTo("#home"));
  buildMenu();
  createWindow();

  app.on("activate", () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on("window-all-closed", () => {
  if (process.platform !== "darwin") app.quit();
});
