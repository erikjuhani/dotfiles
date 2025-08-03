vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.winborder = "rounded"

vim.opt.fileencoding = "utf-8"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0

-- Update buffer when file is changed
vim.opt.autoread = true

-- Force Vi improved
-- vim.opt.nocompatible = true

-- Take indent for new line from previous line
vim.opt.autoindent = true

-- Do smart autoindeting when starting a new line
vim.opt.smartindent = true

-- Write when switching buffers
vim.opt.autowrite = true

-- Write on :quit
vim.opt.autowriteall = true

-- Expands tabs to spaces
vim.opt.expandtab = true

-- Show trailing whitespace, <Tab> and end-of-line
vim.opt.list = true

-- List of strings used for list mode
vim.opt.listchars = { space = "·", tab = "»·", trail = "·", eol = "¬", extends = "#" }

-- Disable swapfile usage
vim.opt.swapfile = false

-- Use visual bell instead of beeping
vim.opt.visualbell = true

-- Show the line number for each line
vim.opt.number = true

-- Show cursor position
vim.opt.ruler = true

-- if non-zero, number of spaces to insert for a <Tab>
vim.opt.softtabstop = 2

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 1

-- Don't give completion messages like 'match 1 of 2'
-- or 'The only match'
vim.opt.shortmess:append("c")

-- TextEdit might fail if hidden is not vim.opt.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false

vim.opt.backupcopy = "yes"

-- Do not write a backup before overwriting
vim.opt.writebackup = false

-- Show the relative line number for each line
vim.opt.relativenumber = true

-- Ignore case when using a search pattern
vim.opt.ignorecase = true

-- Smart caseoverride 'ignorecase' when pattern has upper case characters
vim.opt.smartcase = true

-- No wrapping of long lines
vim.opt.wrap = false

-- Let vim vim.opt the terminal title
-- vim.opt.title = true

-- Do not display the current mode in status line
vim.opt.showmode = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Enable pasting from outside buffer
vim.opt.clipboard = "unnamedplus"

--Always show the signcolumn, otherwise it would shift the text each time
vim.opt.signcolumn = "yes"

vim.opt.completeopt:remove("preview")

vim.opt.shiftwidth = 2

-- TODO: Move this to /after/ftplugin/go.lua
vim.cmd [[
  au FileType go vim.opt expandtab
  au FileType go vim.opt shiftwidth=4
  au FileType go vim.opt softtabstop=4
  au FileType go vim.opt tabstop=4
  let $LANG = 'en'
]]
