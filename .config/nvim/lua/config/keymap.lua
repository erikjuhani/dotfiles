local opts = { noremap = true, silent = true, unique = true }

local keymap = {}

keymap.set = function (lhs, rhs) vim.keymap.set("n", lhs, rhs, opts) end
keymap.set_x = function (lhs, rhs) vim.keymap.set("x", lhs, rhs, opts) end

-- No arrow keys
keymap.set("<Up>", "")
keymap.set("<Down>", "")
keymap.set("<Left>", "")
keymap.set("<Right>", "")

-- Window navigation
keymap.set("<C-h>", "<C-w>h")
keymap.set("<C-j>", "<C-w>j")
keymap.set("<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Buffer navigation
keymap.set("<S-l>", ":bnext<CR>")
keymap.set("<S-h>", ":bprevious<CR>")

-- Diagnostics
keymap.set("<Leader>n", "<cmd>lua vim.diagnostic.goto_next()<cr>")
keymap.set("<Leader>p", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

-- Rename
keymap.set("<Leader>w", "*``cgn")
keymap.set("<Leader>W", "#``cgN")
keymap.set_x("<Leader>W", "<Esc>:let @/ = GetVisualSelection()<CR>cgN")
vim.keymap.set("n", "<Leader>w", "<Esc>:let @/ = GetVisualSelection()<CR>cgn", { noremap = true, silent = true })

-- Diagnostic
keymap.set("<Leader>l", "<cmd>lua vim.diagnostic.open_float()<cr>")

return keymap
