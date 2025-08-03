local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "fish",
    "graphql",
    "go",
    "gomod",
    "gosum",
    "haskell",
    "html",
    "javascript",
    "lua",
    "markdown",
    "mermaid",
    "rust",
    "typescript",
    "vhs",
    "vim",
    "yaml",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
