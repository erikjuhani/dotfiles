vim.cmd [[
  filetype plugin on
  syntax enable
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  let g:everforest_enable_italic=1
  let g:everforest_background='hard'
  let g:everforest_better_performance=1
  let g:everforest_transparent_background=1
  let g:everforest_diagnostic_line_highlight=1
  let g:everforest_diagnostic_virtual_text="colored"
  colorscheme everforest
]]

vim.cmd [[
  hi NormalFloat guifg=NONE guibg=NONE
  hi FloatBorder guibg=NONE
]]

vim.cmd [[
  hi Visual guifg=NONE guibg=#3f3f3f
]]
