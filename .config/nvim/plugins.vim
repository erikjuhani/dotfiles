" PLUGINS

call plug#begin('~/.vim/plugged')

" Wrapper to run tests
Plug 'vim-test/vim-test'

" Display vertical lines of each indentation level
Plug 'Yggdroot/indentLine'

" Color theme
Plug 'morhetz/gruvbox'

" Statusline
Plug 'itchyny/lightline.vim'

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

" TSX and JSX highlight
" Plug 'maxmellon/vim-jsx-pretty'

" Prisma syntax highlight
Plug 'pantharshit00/vim-prisma'

" Fish syntax
Plug 'dag/vim-fish'

" Solarized theme
Plug 'overcache/NeoSolarized'

" Lsp configurations
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Code action and diagnostics
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'tami5/lspsaga.nvim'

" Devicons
Plug 'kyazdani42/nvim-web-devicons'

" Typescript
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Code completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'SirVer/ultisnips'
Plug 'ray-x/lsp_signature.nvim'

" Code formatting
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

" Git commands
Plug 'tpope/vim-fugitive'

" Tree-sitter enhanced syntax colors
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lbrayner/vim-rzip'

call plug#end()
