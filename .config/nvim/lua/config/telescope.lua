local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local keymap = require("config.keymap")

local minimal_finder = function ()
  builtin.find_files(require('telescope.themes').get_dropdown({
    find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
    borderchars = {
      { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
      prompt = {"─", "│", " ", "│", '╭', '╮', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "╯", "╰"},
      preview = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    },
    hidden = true,
    previewer = false,
    prompt_title = false
  }))
end

keymap.set("<Leader>ff", minimal_finder)
keymap.set("<Leader>fg", builtin.live_grep)
keymap.set("<Leader>gs", builtin.grep_string)
keymap.set("<Leader>gr", builtin.lsp_references)

telescope.setup{
  extensions = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  },
  defaults = {
    layout_config = {
      horizontal = { width = 0.75 }
    },
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
      "--hidden",
      "-g",
      "!.git",
      "-g",
      "!.yarn/*",
      "-g",
      "!.yarn.lock"
    },
    file_ignore_patterns = {
      "vendor/*",
      "node_modules/**/*",
      ".yarn/cache/*",
      "dist/**/*",
      ".git/**/*"
    },
    hidden = true,
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
