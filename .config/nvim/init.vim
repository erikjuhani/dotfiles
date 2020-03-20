" Make neovim use Vim config files for compatibility
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Add command InstallPlug if the plugin manager is not installed
if empty(glob("~/.vim/autoload/plug.vim"))
    function InstallPlug()
        execute '!mkdir -p ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    endfunction
    command InstallPlug call InstallPlug()
endif

"
" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

set ma

"----------------------------------------------
" Plugins settings
"----------------------------------------------

call plug#begin('~/.vim/plugged')

" General plugins
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'

Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Language support
Plug 'fatih/vim-go'                                        " Go support
Plug 'reasonml-editor/vim-reason-plus'                     " Reason support
" Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" Plug 'zchee/deoplete-go', { 'do': 'make'}                  " Go auto completion
Plug 'dag/vim-fish'                                        " Fish syntax highlighting
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'} " TypeScript auto completion
Plug 'sheerun/vim-polyglot'

"------------------------ COC ------------------------
" coc for tslinting, auto complete and prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

set encoding=UTF-8

" Theme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

let g:polyglot_disabled = ['markdown']

" coc extensions
let g:coc_global_extensions = [
 \ 'coc-eslint',
 \ 'coc-tsserver',
 \ 'coc-prettier',
 \ 'coc-reason',
 \ 'coc-css',
 \ 'coc-html',
 \ 'coc-json',
 \ 'coc-prettier']

" Airline symbols
let g:airline_powerline_fonts = 1
"let g:airline#extensions#ale#enabled = 1

" deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
au FileType typescript nmap <silent> gd <Plug>(coc-definition)
au FileType typescript.tsx nmap <silent> gd <Plug>(coc-definition)

"----------------------------------------------
" Language: Golang
"----------------------------------------------
set tabstop=2
set shiftwidth=2

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" vim-go uses imports now
let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']

" Build/Test on save.
augroup auto_go
	autocmd!
	autocmd BufWritePost *.go :GoBuild
	autocmd BufWritePost *_test.go :GoTest
augroup end


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
"au FileType typescript set expandtab
"au FileType typescript set shiftwidth=2
"au FileType typescript set softtabstop=2
"au FileType typescript set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

"----------------------------------------------
" Language: Groovy
"----------------------------------------------
au BufNewFile,BufRead Jenkinsfile setf groovy

let $FZF_DEFAULT_COMMAND = "find . -path '*/\.git*' -prune -o -path '*/node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print | sed 's|^\./||' 2> /dev/null"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.8)
  let width = float2nr(&columns * 0.8)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 0

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" easymotion
nmap <Space><Space> <Plug>(easymotion-bd-w)
let g:EasyMotion_smartcase = 1 " turn on case insensitive feature
let g:EasyMotion_do_mapping = 0 " disable default mappings
let g:EasyMotion_use_smartsign_us = 1 " 1 will match 1 and !
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
