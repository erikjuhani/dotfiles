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
set title                         " let vim set the terminal title
set updatetime=750                " redraw the status bar often
filetype plugin on

"----------------------------------------------
" Theme settings
"----------------------------------------------

syntax enable
