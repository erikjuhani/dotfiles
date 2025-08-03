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
  "nvim-tree/nvim-web-devicons",

  {
    "nvim-lua/popup.nvim",
    lazy = false
  },

  {
    "nvim-lua/plenary.nvim",
    lazy = false
  },

  -- Filesystem manipulation in buffer
  {
    "stevearc/oil.nvim",
    opts = {},
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.oil")
    end,
  },

  -- Highlighted TODO comments
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup({})
    end
  },

  -- Diagnostics and formatting
  {
    "creativenull/efmls-configs-nvim",
    lazy = false,
    version = 'v1.x.x',
    dependencies = { 'neovim/nvim-lspconfig' },
  },

  -- Git commands
  {
    "tpope/vim-fugitive",
    lazy = false
  },

  -- Statusline
  {
    "itchyny/lightline.vim",
    lazy = false,
    dependencies = { "sainnhe/everforest" },
    config = function()
      require("config.lightline")
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

  -- Theme & Colorscheme
  {
    "sainnhe/everforest",
    priority = 1000,
    lazy = false,
    config = function()
      require("config.everforest")
    end,
  },

  -- Cmp plugins
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("config.cmp")
    end,
  },

  -- Function signature paramater highlight
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded"
      },
      floating_window_off_y = -1,
      max_height = 3,
      hint_enable = false,
    }
  },

  -- LSP configs
  "neovim/nvim-lspconfig",

  {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    lazy = false,
    config = function()
      require("config.mason")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
  },

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
      require("config.telescope")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    run = ":TSUpdate",
    config = function()
      require("config.treesitter")
    end,
  },

  {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup()
      end
  },

  {
    "chaoren/vim-wordmotion",
    lazy = false
  },

  {
    "FooSoft/vim-argwrap",
    lazy = false,
    config = function()
      require("config.arg-wrap")
    end
  },

  "ray-x/go.nvim",

  {
    "mrcjkb/rustaceanvim",
    version = '^6',
    lazy = false
  },
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
