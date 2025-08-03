require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = require("config.servers"),
  automatic_enable = false
})
