require('lush')(require('apprentice').setup({
  plugins = {
    "cmp", -- nvim-cmp
    "fzf",
    "lsp",
    "packer",
    "telescope",
    "treesitter"
  },
  langs = {
    "c",
    "golang",
    "haskell",
    "html",
    "java",
    "js",
    "json",
    "jsx",
    "lua",
    "markdown",
    "ocaml",
    "python",
    "ruby",
    "rust",
    "scala",
    "typescript",
    "viml",
  }
}))

vim.cmd [[
  filetype plugin on
  syntax enable
  set termguicolors
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark
  colorscheme apprentice
]]

vim.cmd [[
  hi link NormalFloat Default
]]
