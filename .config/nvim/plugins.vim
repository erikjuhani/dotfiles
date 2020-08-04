" ██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗ "
" ██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝ "
" ██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░ "
" ██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗ "
" ██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝ "
" ╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░ "
"

call plug#begin('~/.vim/plugged')

" TODO: Look into why coc eslinter does not work correctly
Plug 'dense-analysis/ale'

" Wrapper to run tests
Plug 'vim-test/vim-test'

" Display vertical lines of each indentation level
Plug 'Yggdroot/indentLine'

" Color theme
Plug 'morhetz/gruvbox'

" Statusline
Plug 'itchyny/lightline.vim'

"
Plug 'Lokaltog/vim-easymotion'
"
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

"==========================
"==== LANGUAGE SUPPORT ====
"==========================

" Go
Plug 'fatih/vim-go'                                        " Go support
" Fish
Plug 'dag/vim-fish'                                        " Fish syntax highlighting
"
Plug 'sheerun/vim-polyglot'

"------------------------ COC ------------------------
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()
