local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- Treesitter setup
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
    "prisma",
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
