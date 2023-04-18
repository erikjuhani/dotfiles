local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",

  -- cache
  {
    'lewis6991/impatient.nvim',
    lazy = false,
    priority = 1001,
  },

  -- git commands
  "tpope/vim-fugitive",

  -- style
  { 
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- TODO: Re-organize plugin configurations to own folder config/<plugin>.lua
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
    end,
  },

  -- cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "ray-x/lsp_signature.nvim",

  -- lsp
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/nvim-lsp-ts-utils",

  -- telescope
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make'
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    cmd = 'Telescope',
    build = "make",
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- Statusline
  "itchyny/lightline.vim",

  -- Motion
  "chaoren/vim-wordmotion",
  "FooSoft/vim-argwrap",

  -- Language specifics
  "ray-x/go.nvim",
}

-- Use a protected call so we don't error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

lazy.setup(plugins)
