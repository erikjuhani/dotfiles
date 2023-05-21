local ok, oil = pcall(require, "oil")
if not ok then
  return
end

oil.setup({
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["q"] = "actions.close",
    ["<Esc>"] = "actions.close",
  },
  float = {
    padding = 4,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  }
})
