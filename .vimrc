scriptencoding utf-8

" Force Vi improved
set nocompatible

" Take indent for new line from previous line
set autoindent

" Do smart autoindeting when starting a new line
set smartindent

" Write when switching buffers
set autowrite

" Write on :quit
set autowriteall

" Expands tabs to spaces
set expandtab

" Show trailing whitespace, <Tab> and end-of-line
set list

" List of strings used for list mode
set listchars=tab:»·,trail:·,eol:¬,extends:#,space:·

" Disable swapfile usage
set noswapfile
"set nowrap

" Use visual bell instead of beeping
set visualbell

" Show the line number for each line
set number

" Show cursor position
set ruler

" if non-zero, number of spaces to insert for a <Tab>
set softtabstop=1

" Number of spaces that a <Tab> in the file counts for
set tabstop=1

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup

set backupcopy=yes

" Do not write a backup before overwriting
set nowritebackup

" No swap files
set noswapfile

" Show the relative line number for each line
set relativenumber

" Ignore case when using a search pattern
set ignorecase

" Smart caseoverride 'ignorecase' when pattern has upper case characters
set smartcase

" No wrapping of long lines
set nowrap

" Let vim set the terminal title
set title

" Do not display the current mode in status line
set noshowmode

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Enable pasting from outside buffer
set clipboard=unnamedplus

set completeopt-=preview

" Always show the signcolumn, otherwise it would shift the text each time
set signcolumn=yes

" Enable file type detection
filetype plugin on

" Enable syntax highlighting
syntax enable

" Enables 24-bit RGB color
set termguicolors

" Vim only
set background=light
