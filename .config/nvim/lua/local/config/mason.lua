local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup()

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "clangd",
    "cssls",
    "denols",
    "dockerls",
    "diagnosticls",
    "eslint",
    "gopls",
    "graphql",
    "jsonls",
    "lua_ls",
    "prismals",
    "rust_analyzer",
    "taplo",
    "tsserver",
    "yamlls",
  },
})
