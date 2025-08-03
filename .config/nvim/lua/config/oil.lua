local oil = require("oil")
local keymap = require("config.keymap")

keymap.set("<Leader>e", oil.toggle_float)

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
