"----------------------------------------------
" General settings
"----------------------------------------------
set encoding=utf-8
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowrite                     " write when switching buffers
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set completeopt-=preview          " remove the horrendous preview window
set expandtab                     " expands tabs to spaces
set list                          " show trailing whitespace
set listchars=tab:»·,trail:·,eol:¬,extends:#,space:·
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set visualbell
"set noerrorbells                  " No bells!
"set novisualbell                  " I said, no bells!
set number                        " show number ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=1
set laststatus=2
set tabstop=1

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Only one line for command line
set cmdheight=2

set ma

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Let vim set the terminal title
set title

set noshowmode

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
filetype plugin on

"----------------------------------------------
" Theme settings
"----------------------------------------------

syntax enable
