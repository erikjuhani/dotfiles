local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

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

require('telescope').load_extension('fzf')

-- Show minimal search box for file find
function minimal_finder()
  return require('telescope.themes').get_dropdown({
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
  })
end

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap
local function nmap(lhs, rhs) set_keymap("n", lhs, rhs, opts) end

-- Telescope keymap
nmap("<Leader>p", "<cmd>lua require('telescope.builtin').find_files(minimal_finder())<CR>")
nmap("<Leader>g", "<cmd>lua require('telescope.builtin').live_grep()<CR>")

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
