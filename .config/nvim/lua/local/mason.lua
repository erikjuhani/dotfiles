local ok, mason = pcall(require, "mason")
if not ok then
  return
end

mason.setup()

local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
  return
end

local servers = {
  "clangd",
  "cssls",
  -- "denols",
  "dockerls",
  "gopls",
  "jsonls",
  "lua_ls",
  "rust_analyzer",
  "tsserver",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

local opts = { noremap = true, silent = true }
local set_buf_keymap = vim.api.nvim_buf_set_keymap
local function buf_nmap(bufnr)
  return function(lhs, rhs) set_buf_keymap(bufnr, "n", lhs, rhs, opts) end
end

local lsp_nmap = function(bufnr)
  local nmap = buf_nmap(bufnr)
  nmap("<Leader>l", "<cmd>lua vim.diagnostic.open_float()<cr>")
  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  nmap("<Leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")
  nmap("<leader>a", ":ArgWrap<cr>")
end

local on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup_client(client)
  end

  if client.name == "rust-analyzer" then
    vim.cmd("autocmd BufWritePre * :lua vim.lsp.buf.format({ async = true })")
  else
    vim.cmd("autocmd BufWritePre * :lua vim.lsp.buf.format()")
  end

  lsp_nmap(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact" },
  capabilities = capabilities
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      linksInHover = false,
      codelenses = {
        generate = true,
        gc_details = false,
        regenerate_cgo = true,
        tidy = false,
        upgrade_depdendency = true,
        vendor = true,
      },
      usePlaceholders = true,
    },
  },
}

require('go').setup()

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})

-- Reload file
vim.api.nvim_create_autocmd("CursorHold", {
  command = "checktime",
})

local lsp = vim.lsp

lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 2,
      prefix = '',
      format = function(diagnostic)
        local m = diagnostic.message
        -- truncate long diagnostic messages
        if m:len() > 20 then
          m = m:sub(1, 20) .. '..'
        end
        return string.format("%s", m)
      end
    },
    signs = true,
    update_in_insert = false,
  }
)
