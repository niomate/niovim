local CONFIG_PATH = "~/.config/nvim/"

vim.api.nvim_create_user_command(
  "OpenConfig",
  function(opts)
    -- TODO: Autocompletion with all files in the config directory
    -- TODO: Extract config path from vim functions
    local path = CONFIG_PATH .. "lua/" .. opts.args .. ".lua"
    vim.cmd("e " .. path)
  end,
  {nargs = 1}
)

-- TODO: Doesn't really work yet
vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {nargs = 0})

vim.api.nvim_create_user_command("LuaSnipEdit", ':lua require("luasnip.loaders").edit_snippet_files()', {nargs = 0})

-- Convert CRLF to Unix line endings
vim.api.nvim_create_user_command("ConvertCRLF", ":%s/\r//g", {nargs=0})
