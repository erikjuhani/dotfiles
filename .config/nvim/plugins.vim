" ██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗
" ██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝
" ██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░
" ██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗
" ██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝
" ╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░

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

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Go
Plug 'fatih/vim-go'                                        " Go support

" Language pack collection
Plug 'sheerun/vim-polyglot'

" Conquer of Completion - intellisense engine
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': { -> coc#util#install() } }

call plug#end()
