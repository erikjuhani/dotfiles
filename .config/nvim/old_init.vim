scriptencoding utf-8

" Disable arrow keys 💯
" To enable comment these out
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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
" source ~/.config/nvim/keymaps.vim

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

let g:vim_json_conceal = 0

let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ }

set termguicolors

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let g:gruvbox_contrast_dark = 'hard'
"colorscheme gruvbox

" >> Solarized theme
set background=dark
let g:solarized_visibility = "low"
colorscheme solarized

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
" Language: VIM
"----------------------------------------------
au FileType vim set expandtab
au FileType vim set shiftwidth=2
au FileType vim set softtabstop=2
au FileType vim set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Javascript
"----------------------------------------------
au FileType javascript set expandtab
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set expandtab
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2
au FileType typescript set tabstop=2

"----------------------------------------------
" Language: TypeScriptReact
"----------------------------------------------
au FileType typescriptreact set expandtab
au FileType typescriptreact set shiftwidth=2
au FileType typescriptreact set softtabstop=2
au FileType typescriptreact set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

nmap <Space><Space> <Plug>(easymotion-bd-w)

set completeopt=menuone,noselect

let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

hi link NormalFloat Normal

lua << EOF
-- General LSP Configuration
local nvim_lsp = require"lspconfig"

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = { noremap = true, silent = true }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 2,
      prefix = '',
      format = function(diagnostic)
        local m = diagnostic.message
        -- truncate long diagnostic messages
        if m:len() > 20 then
          m = m:sub(1, 20) .. '..'
        end
        return string.format("%s", m)
      end
    },
    signs = true,
    update_in_insert = false,
  }
)

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- Saga lsp configuration
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '', -- 
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = 'round',
  code_action_keys = { quit = '<ESC>', exec = '<CR>' },
}

-- Show help on hover
--diagnostic = require'lspsaga.diagnostic'
--signaturehelp = require'lspsaga.signaturehelp'

-- vim.cmd [[autocmd CursorHold * lua diagnostic.show_cursor_diagnostics()]]
-- vim.cmd [[autocmd CursorHoldI * silent! lua signaturehelp.signature_help()]]

-- Telescope configuration
local actions = require('telescope.actions')

require('telescope').setup{
  extensions = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
  defaults = {
    layout_config = {
      horizontal = { width = 0.75 }
    },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
      "--hidden",
      "-g",
      "!.git",
      "-g",
      "!.yarn/*",
      "-g",
      "!.yarn.lock"
    },
    file_ignore_patterns = {
      "vendor/*",
      "node_modules/**/*",
      ".yarn/cache/*",
      "dist/**/*",
      ".git/**/*"
    },
    hidden = true,
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

require('telescope').load_extension('fzf')

-- Show minimal search box for file find
function minimal_finder()
  return require('telescope.themes').get_dropdown({
    find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },
    hidden = true,
    previewer = false,
    prompt_title = false
  })
end

local opts = { noremap = true, silent = true }

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Telescope keymap
vim.api.nvim_set_keymap('n', '<C-p>', "<Cmd>lua require('telescope.builtin').find_files(minimal_finder())<CR>", opts)
vim.api.nvim_set_keymap('n', '<C-g>', "<Cmd>lua require('telescope.builtin').live_grep()<CR>", opts)

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Saga keymap
  --buf_set_keymap('n', '<C-k>', "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  --buf_set_keymap('n', '<C-j>', "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  --buf_set_keymap('n', '<C-l>', "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
  --buf_set_keymap('n', 'gh', "<Cmd>Lspsaga lsp_finder<CR>", opts)
  --buf_set_keymap('n', '<c-p>', "<Cmd>Lspsaga preview_definition<CR>", opts)
  --buf_set_keymap('n', 'K', "<Cmd>Lspsaga hover_doc<CR>", opts)

  -- Go to definition
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', '<C-l>', "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)

  -- Typescript specific configurations
  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false

    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup_client(client)
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end

  require "lsp_signature".on_attach()
end

--Set completeopt to have a better completion experience
vim.o.completeopt = "menu,menuone,noselect"

 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/`.
  -- cmp.setup.cmdline('/', {
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  -- Use cmdline & path source for ':'.
  -- cmp.setup.cmdline(':', {
  --  sources = cmp.config.sources({
  --    { name = 'path' }
  --  }, {
  --    { name = 'cmdline' }
  --  })
  --})

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
    init_options = {
      linters = {
        eslint = {
          sourceName = 'eslint_d',
          command = 'eslint_d',
          debounce = 100,
          args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
          parseJson = {
            errorsRoot = '[0].messages',
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[${ruleId}]: ${message}',
            security = 'severity'
          },
          securities = {
            [3] = 'error',
            [2] = 'warning'
          },
          rootPatterns = {
            '.git',
            '.eslintrc',
            '.eslintrc.cjs',
            '.eslintrc.js',
            '.eslintrc.json',
            '.eslintrc.yaml',
            '.eslintrc.yml',
          },
        },
      },
      filetypes = {
        javascript = 'eslint',
        javascriptreact = 'eslint',
        typescript = 'eslint',
        typescriptreact = 'eslint',
      },
      formatters = {
        eslint_d = {
          command = 'eslint_d',
          args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
          rootPatterns = { '.git', '.eslintrc' },
        },
        prettier = {
          sourceName = 'prettier',
          command = 'node_modules/.bin/prettier',
          args = { '--stdin', '--stdin-filepath', '%filepath' },
          rootPatterns = {
            '.prettierrc',
            '.prettierrc.json',
            '.prettierrc.toml',
            '.prettierrc.json',
            '.prettierrc.yml',
            '.prettierrc.yaml',
            '.prettierrc.json5',
            '.prettierrc.js',
            '.prettierrc.cjs',
            'prettier.config.js',
            'prettier.config.cjs',
            '.git',
          },
        }
      },
      formatFiletypes = {
        css = 'prettier',
        javascript = 'prettier',
        javascriptreact = 'prettier',
        json = 'prettier',
        scss = 'prettier',
        less = 'prettier',
        typescript = 'prettier',
        typescriptreact = 'prettier',
        json = 'prettier',
        markdown = 'prettier',
      }
    }
  }

  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact" },
    capabilities = capabilities
  }

  nvim_lsp.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        linksInHover = false,
        codelens = {
          generate = true,
          gc_details = true,
          regenerate_cgo = true,
          tidy = true,
          upgrade_depdendency = true,
          vendor = true,
        },
        usePlaceholders = true,
      },
    },
  }
EOF

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

nnoremap <C-n> :next<CR>
nnoremap <C-b> :prev<CR>

" Toggle terminal on/off (neovim)
nnoremap <C-t> :call TermToggle(12)<CR>
inoremap <C-t> <Esc>:call TermToggle(12)<CR>
tnoremap <C-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
