const fs = require("node:fs/promises");
const path = require("node:path");
const { default: pngToIco } = require("png-to-ico");

const root = path.resolve(__dirname, "..");
const source = path.join(root, "assets", "gogoshop.png");
const destination = path.join(root, "assets", "gogoshop.ico");

pngToIco(source).then((buffer) => fs.writeFile(destination, buffer));
