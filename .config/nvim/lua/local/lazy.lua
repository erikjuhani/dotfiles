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
  { "nvim-lua/popup.nvim",   lazy = false },
  { "nvim-lua/plenary.nvim", lazy = false },

  "nvim-tree/nvim-web-devicons",

  -- filesystem manipulation in buffer
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("local.oil")
    end,
  },

  -- diagnostics and formatting
  {
    "creativenull/efmls-configs-nvim",
    lazy = false,
    config = function()
      require("local.efmls")
    end,
  },

  -- git commands
  { "tpope/vim-fugitive",     lazy = false },

  -- Statusline
  {
    "itchyny/lightline.vim",
    lazy = false,
    dependencies = { "sainnhe/everforest" },
    config = function()
      require("local.lightline")
    end,
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    lazy = false,
    config = function()
      require('Comment').setup()
    end,
  },

  -- style
  {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
      require("local.everforest")
    end,
  },

  -- cmp plugins
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("local.cmp")
    end,
    event = 'InsertEnter',
  },

  "ray-x/lsp_signature.nvim",

  -- lsp
  "neovim/nvim-lspconfig",
  "jose-elias-alvarez/nvim-lsp-ts-utils",

  {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    lazy = false,
    config = function()
      require("local.mason")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    event = 'VimEnter',
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "telescope-fzf-native.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      }
    },
    lazy = false,
    cmd = "Telescope",
    build = "make",
    config = function()
      require("local.telescope")
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("local.treesitter")
    end,
  },

  -- Motion
  { "chaoren/vim-wordmotion", lazy = false },
  { "FooSoft/vim-argwrap",    lazy = false },

  -- Language specifics
  "ray-x/go.nvim",
  "simrat39/rust-tools.nvim",
}

-- Use a protected call so we don"t error out on first use
local ok, lazy = pcall(require, "lazy")
if not ok then
  return
end

lazy.setup(plugins, {
  defaults = { lazy = true },
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  }
})
