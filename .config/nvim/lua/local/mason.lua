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
  "denols",
  "dockerls",
  "efm",
  "eslint",
  "marksman",
  "gopls",
  "jsonls",
  "lua_ls",
  "tailwindcss",
  "ts_ls",
  "yamlls",
}

mason_lspconfig.setup({
  ensure_installed = servers,
})

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

local opts = { noremap = true, silent = true }
local set_buf_keymap = vim.api.nvim_buf_set_keymap
local function buf_nmap(bufnr)
  return function(lhs, rhs) set_buf_keymap(bufnr, "n", lhs, rhs, opts) end
end

local lsp_nmap = function(bufnr)
  local nmap = buf_nmap(bufnr)
  nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  nmap("<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
  nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>")
  nmap("<Leader>r", "<cmd>lua vim.lsp.buf.rename()<cr>")
end

local on_attach = function(client, bufnr)
  if client.name == "ts_ls" then
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup_client(client)
  end

  lsp_nmap(bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod" },
  callback = function()
    require('go').setup()
  end,
  group = vim.api.nvim_create_augroup("GoFileType", {})
})

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
  }
}

lspconfig.eslint.setup {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("package.json"),
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}

lspconfig.marksman.setup {
  filetypes = { 'markdown' },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.tailwindcss.setup {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.lua_ls.setup {
  filetypes = { 'lua' },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.jsonls.setup {
  filetypes = { 'json', 'json5' },
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.yamlls.setup {
  filetypes = { '.yml', '.yaml' },
  capabilities = capabilities,
  on_attach = on_attach
}

vim.api.nvim_create_user_command("DenoFormat", function()
    vim.cmd(string.format('silent !deno fmt %s', vim.api.nvim_buf_get_name(0)))
end, {})

lspconfig.denols.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      command = "DenoFormat",
    })
    on_attach(client, bufnr)
  end
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern("package.json"),
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
        local source = diagnostic.source
        -- truncate long diagnostic messages
        if m:len() > 20 then
          m = m:sub(1, 20) .. '..'
        end
        return string.format("[%s] %s", source, m)
      end
    },
    signs = true,
    update_in_insert = false,
  }
)
