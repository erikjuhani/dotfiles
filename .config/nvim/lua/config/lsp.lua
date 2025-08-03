local servers = require("config.servers")

-- NOTE: This is an example using the native auto-completion, not as good as cmp
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if client and client:supports_method('textDocument/completion') then
--       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--
--       local opts = { buffer = ev.buf, expr = true, noremap = true, silent = true }
--
--       -- Tab to select next item in popup menu if it's visible
--       -- vim.keymap.set("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], opts)
--       -- vim.keymap.set("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], opts)
--       -- vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<CR>"]], opts)
--       -- Smart tab completion mapping (buffer-local)
--
--       -- Tab: select next item in popup if visible, else insert tab
--       vim.keymap.set("i", "<Tab>", "pumvisible() ? '<C-n>' : '<Tab>'", opts)
--       vim.keymap.set("i", "<S-Tab>", "pumvisible() ? '<C-p>' : '<S-Tab>'", opts)
--
--       -- Enter: confirm selection if popup visible, else insert newline
--       vim.keymap.set("i", "<CR>", "pumvisible() ? '<C-y>' : '<CR>'", opts)
--     end
--   end,
-- })

vim.lsp.config("*", {
  on_attach = function ()
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  end
})

vim.lsp.enable(servers)

-- vim.api.nvim_create_user_command("DenoFormat", function()
--     vim.cmd(string.format('silent !deno fmt %s', vim.api.nvim_buf_get_name(0)))
-- end, {})

-- lspconfig.eslint.setup {
--   filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("package.json"),
--   on_attach = function(_, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       buffer = bufnr,
--       command = "EslintFixAll",
--     })
--   end,
-- }

-- lspconfig.denols.setup {
--   capabilities = capabilities,
--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
--   on_attach = function(client, bufnr)
--     vim.api.nvim_create_autocmd("BufWritePost", {
--       buffer = bufnr,
--       command = "DenoFormat",
--     })
--     on_attach(client, bufnr)
--   end
-- }

-- lspconfig.gopls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "gopls", "serve" },
--   settings = {
--     gopls = {
--       analyses = {
--         unusedparams = true,
--       },
--       staticcheck = true,
--       linksInHover = false,
--       codelenses = {
--         generate = true,
--         gc_details = false,
--         regenerate_cgo = true,
--         tidy = false,
--         upgrade_depdendency = true,
--         vendor = true,
--       },
--       usePlaceholders = true,
--     },
--   },
-- }
