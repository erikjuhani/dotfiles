local set = vim.opt

set.fileencoding = "utf-8"
set.completeopt = { "menuone", "noselect" }
set.conceallevel = 0

-- Update buffer when file is changed
set.autoread = true

-- Force Vi improved
-- set.nocompatible = true

-- Take indent for new line from previous line
set.autoindent = true

-- Do smart autoindeting when starting a new line
set.smartindent = true

-- Write when switching buffers
set.autowrite = true

-- Write on :quit
set.autowriteall = true

-- Expands tabs to spaces
set.expandtab = true

-- Show trailing whitespace, <Tab> and end-of-line
set.list = true

-- List of strings used for list mode
set.listchars = { space = "·", tab = "»·", trail = "·", eol = "¬", extends = "#" }

-- Disable swapfile usage
set.swapfile = false

-- Use visual bell instead of beeping
set.visualbell = true

-- Show the line number for each line
set.number = true

-- Show cursor position
set.ruler = true

-- if non-zero, number of spaces to insert for a <Tab>
set.softtabstop = 2

-- Number of spaces that a <Tab> in the file counts for
set.tabstop = 1

-- Don't give completion messages like 'match 1 of 2'
-- or 'The only match'
set.shortmess:append("c")

-- TextEdit might fail if hidden is not set.
set.hidden = true

-- Some servers have issues with backup files, see #649.
set.backup = false

set.backupcopy = "yes"

-- Do not write a backup before overwriting
set.writebackup = false

-- Show the relative line number for each line
set.relativenumber = true

-- Ignore case when using a search pattern
set.ignorecase = true

-- Smart caseoverride 'ignorecase' when pattern has upper case characters
set.smartcase = true

-- No wrapping of long lines
set.wrap = false

-- Let vim set the terminal title
-- set.title = true

-- Do not display the current mode in status line
set.showmode = false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
set.updatetime = 300

-- Enable pasting from outside buffer
set.clipboard = "unnamedplus"

--Always show the signcolumn, otherwise it would shift the text each time
set.signcolumn = "yes"

set.completeopt:remove("preview")

set.shiftwidth = 2

vim.cmd [[
  au FileType go set expandtab
  au FileType go set shiftwidth=4
  au FileType go set softtabstop=4
  au FileType go set tabstop=4
  let $LANG = 'en'
]]
