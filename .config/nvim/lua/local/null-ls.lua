local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local attach_to = {
  sh = function()
    -- always attach null-ls to sh files
    return true
  end,
  default = function(bufnr)
    -- search for package.json as we can also use a different lsp like denols for formatting and linting.
    -- if we do not handle this separately we will have a conflict between the lsp and formatting tools.
    package_json = table.getn(vim.fs.find(
      { 'package.json' },
      { upward = true, stop = vim.loop.os_homedir(), path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)) }))

    -- if package_json file is found attach null_ls
    return package_json ~= 0
  end,
}

null_ls.setup {
  debug = false,
  should_attach = function(bufnr)
    local fn = attach_to[vim.bo.filetype]

    if not fn then
      return attach_to["default"](bufnr)
    end

    return fn(bufnr)
  end,
  sources = {
    formatting.prettier,
    formatting.shfmt.with({
      extra_args = { "-i", "2", "-ci", "-w" },
    }),
    diagnostics.eslint,
    diagnostics.shellcheck,
  },
}
