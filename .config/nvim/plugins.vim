" ██████╗░██╗░░░░░██╗░░░██╗░██████╗░██╗███╗░░██╗░██████╗
" ██╔══██╗██║░░░░░██║░░░██║██╔════╝░██║████╗░██║██╔════╝
" ██████╔╝██║░░░░░██║░░░██║██║░░██╗░██║██╔██╗██║╚█████╗░
" ██╔═══╝░██║░░░░░██║░░░██║██║░░╚██╗██║██║╚████║░╚═══██╗
" ██║░░░░░███████╗╚██████╔╝╚██████╔╝██║██║░╚███║██████╔╝
" ╚═╝░░░░░╚══════╝░╚═════╝░░╚═════╝░╚═╝╚═╝░░╚══╝╚═════╝░

call plug#begin('~/.vim/plugged')

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

" Go support
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" Shell script syntax highlight
Plug 'arzg/vim-sh'

" Dockerfile syntax highlight
Plug 'ekalinin/Dockerfile.vim'

" Nginx syntax highlight
Plug 'chr4/nginx.vim'

" Typescript syntax highlight
Plug 'HerringtonDarkholme/yats.vim'

" TSX and JSX highlight
Plug 'maxmellon/vim-jsx-pretty'

" Prisma syntax highlight
Plug 'pantharshit00/vim-prisma'

" Conquer of Completion - intellisense engine
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

" Gruvbox theme
Plug 'morhetz/gruvbox'

call plug#end()
