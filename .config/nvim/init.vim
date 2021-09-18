" ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
" ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
" ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
" ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
" ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
" ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

scriptencoding utf-8

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

" Include source configurations
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keymaps.vim

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Return to last edit position when opening a file
augroup resume_edit_position
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | execute "normal! g`\"zvzz"
        \ | endif
augroup END

" ░█████╗░░█████╗░░█████╗░
" ██╔══██╗██╔══██╗██╔══██╗
" ██║░░╚═╝██║░░██║██║░░╚═╝
" ██║░░██╗██║░░██║██║░░██╗
" ╚█████╔╝╚█████╔╝╚█████╔╝
" ░╚════╝░░╚════╝░░╚════╝░

let g:coc_global_extensions = [
    \ 'coc-yaml',
    \ 'coc-python',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" ████████╗██╗░░██╗███████╗███╗░░░███╗███████╗
" ╚══██╔══╝██║░░██║██╔════╝████╗░████║██╔════╝
" ░░░██║░░░███████║█████╗░░██╔████╔██║█████╗░░
" ░░░██║░░░██╔══██║██╔══╝░░██║╚██╔╝██║██╔══╝░░
" ░░░██║░░░██║░░██║███████╗██║░╚═╝░██║███████╗
" ░░░╚═╝░░░╚═╝░░╚═╝╚══════╝╚═╝░░░░░╚═╝╚══════╝

let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ }

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox

"----------------------------------------------
" Language: Golang
"----------------------------------------------
set tabstop=2
set shiftwidth=2

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_fmt_command = "goimports"
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 0
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_list_type = 'quickfix'
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" Build/Test on save.
augroup auto_go
  autocmd!
  autocmd BufWritePost *.go :GoBuild
  autocmd BufWritePost *_test.go :GoTest
augroup end

" Quit anyway if the quickfix window is the only one left
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

"----------------------------------------------
" Language: NGINX
"----------------------------------------------
au BufNewFile,BufRead default.conf set filetype=nginx
au BufNewFile,BufRead *nginx*.conf set filetype=nginx

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
au BufNewFile,BufRead *.ts setlocal filetype=typescript

au BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
au BufNewFile,BufRead *.tsx set filetype=typescript.tsx

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

"----------------------------------------------
" Language: Groovy
"----------------------------------------------
au BufNewFile,BufRead Jenkinsfile setf groovy

"----------------------------------------------
" Fuzzy Finder
"----------------------------------------------
let $FZF_DEFAULT_COMMAND = "find . -path '*/\.git*' -prune -o -path '**/coverage/**' -prune -o -path '**/allure-results/**' -prune -o -path '*/node_modules/**' -prune -o -path '**/.yarn/**' -prune -o -path '**/dist/**' -prune -o  -type f -print -o -type l -print | sed 's|^\./||' 2> /dev/null"
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

"----------------------------------------------
" EasyMotion
"----------------------------------------------
let $EASYMOTION_KEYS = "abcdefghijklmnopqrstuvwxyz"
let g:EasyMotion_smartcase = 1 " turn on case insensitive feature
let g:EasyMotion_do_mapping = 0 " disable default mappings
let g:EasyMotion_use_smartsign_us = 1 " 1 will match 1 and !
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = $EASYMOTION_KEYS
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_enter_jump_first = 1
