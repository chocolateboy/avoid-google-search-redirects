const manifest = require('../manifest.json')
const matches = require('./google-matches.json')

manifest.content_scripts[0].matches = matches

const json = JSON.stringify(manifest, null, 4)

console.log(json)
