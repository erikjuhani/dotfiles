-- Reload file
vim.api.nvim_create_autocmd("CursorHold", {
  command = "checktime",
})

-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})

-- TODO: Move to /after/ftplugin/go.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod" },
  callback = function()
    require('go').setup()
  end,
  group = vim.api.nvim_create_augroup("GoFileType", {})
})

