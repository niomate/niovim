-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath
    }
  )
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ","
vim.g.maplocalleader = ","

CONFIG_PATH = "$HOME/.config/nvim/"
require "plugins"


require "setups.bufferline"
require "setups.clangd_extensions"
require "setups.flash"
require "setups.formatter"
require "setups.indent_blankline"
require "setups.kommentary"
require "setups.luasnip"
require "setups.neorg"
require "setups.nvim-cmp"
require "setups.rust-tools"
require "setups.statusline"
require "setups.subversive"
require "setups.telescope"
require "setups.treesitter"
require "setups.vimtex"

require "settings"
require "commands"
require "keymap"
require "lsp"
