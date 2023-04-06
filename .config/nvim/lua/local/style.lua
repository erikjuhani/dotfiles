vim.cmd [[
  filetype plugin on
  syntax enable
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  let g:sonokai_better_performance=1
  let g:sonokai_enable_italic=1
  let g:sonokai_transparent_background=1
  let g:sonokai_diagnostic_line_highlight=1
  let g:sonokai_diagnostic_virtual_text='colored'
  colorscheme sonokai
]]

vim.cmd [[
  hi NormalFloat guifg=NONE guibg=NONE
  hi FloatBorder guibg=NONE
  hi DiagnosticFloatingError guifg=#fc5d7c guibg=NONE
  hi DiagnosticFloatingWarn guifg=#e7c664 guibg=NONE
  hi DiagnosticFloatingInfo guifg=#76cce0 guibg=NONE
]]

vim.cmd [[
  hi Visual guifg=NONE guibg=#3f3f3f
]]
