local opts = { noremap = true, silent = true }

local set_keymap = vim.api.nvim_set_keymap
-- Parameter names can be looked from the help
-- Example :h lhs
-- TODO: Add optional parameter to merge opts
-- TODO: Alternate way to handle key maps
-- Example: nnoremap "<Leader>x :do_something". For easier copy&paste and interoperability.
local function nmap(lhs, rhs) set_keymap("n", lhs, rhs, opts) end
local function xmap(lhs, rhs) set_keymap("x", lhs, rhs, opts) end

-- Leader as <Space>
set_keymap("", "<Space>", "", opts)

nmap("<Up>", "") 
nmap("<Down>", "") 
nmap("<Left>", "") 
nmap("<Right>", "") 

-- Window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Buffer navigation
nmap("<S-l>", ":bnext<CR>")
nmap("<S-h>", ":bprevious<CR>")

-- Rename
nmap("<Leader>w", "*``cgn")
nmap("<Leader>W", "#``cgN")
xmap("<Leader>w", "<Esc>:let @/ = GetVisualSelection()<CR>cgn")
xmap("<Leader>W", "<Esc>:let @/ = GetVisualSelection()<CR>cgN")

-- Telescope
nmap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files(minimal_finder())<CR>")
nmap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nmap("<Leader>gs", "<cmd>lua require('telescope.builtin').grep_string()<CR>")
nmap("<Leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
