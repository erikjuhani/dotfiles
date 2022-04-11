local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local set_keymap = vim.api.nvim_set_keymap
-- Parameter names have been chosen as these are the keywords that can be looked from the help
-- Example :h lhs
local function nmap(lhs, rhs) set_keymap("n", lhs, rhs, opts) end

-- Leader as <Space>
set_keymap("", "<Space>", "", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nmap("<Up>", "") 
nmap("<Down>", "") 
nmap("<Left>", "") 
nmap("<Right>", "") 

-- nmap("<Leader><Leader>", "<Plug>(easymotion-bd-w)")
nmap("<Leader>j", "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>")

-- Window navigation
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Buffer navigation
nmap("<S-l>", ":bnext<CR>")
nmap("<S-h>", ":bprevious<CR>")
