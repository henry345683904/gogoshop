const { contextBridge, ipcRenderer } = require("electron");

contextBridge.exposeInMainWorld("gogoDesktop", {
  isDesktopManager: true,
  openAdmin: () => ipcRenderer.send("gogo-open-admin"),
  openStorefront: () => ipcRenderer.send("gogo-open-storefront")
});
