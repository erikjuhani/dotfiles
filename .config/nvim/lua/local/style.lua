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
  hi link NormalFloat Default
]]

vim.cmd [[
  hi Visual guifg=#252525 guibg=#5f8787
]]
