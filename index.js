const { secretbox } = require("tweetnacl");
var fs = require("fs");

fs.writeFileSync('output/tweetnacl.enc', secretbox(fs.readFileSync("input.txt"), new Uint8Array(24).fill(0), new Uint8Array(32).fill(0)))
