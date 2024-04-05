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

-- Load plugins
require("lazy").setup("plugins")

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.completeopt = {"menuone", "noinsert", "noselect", "preview"}

vim.opt.cursorline = true

vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.shortmess:append({c = true})

--Automatically refresh files when they are changed outside the buffer
vim.opt.autoread = true

--Search configuration
vim.opt.ignorecase = true --ignore case when searching
vim.opt.smartcase = true --turn on smartcase

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.linebreak = true
vim.opt.scrolloff = 5

vim.opt.updatetime = 300
vim.opt.cmdheight = 2
vim.opt.signcolumn = "yes"

--Use system clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 1

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.scroll = 5
vim.opt.cursorline = true

vim.cmd [[colorscheme gruvbox]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

-- Remove trailing whitespaces
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

vim.g.dashboard_default_executive = "fzf"

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

-- Convert CRLF to Unix line endings
vim.api.nvim_create_user_command("ConvertCRLF", ":%s/\r//g", {nargs = 0})

-- Autoclose if CHADtree is last window open
-- vim.cmd [[autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif]]
vim.api.nvim_create_autocmd(
  {"BufEnter"},
  {
    pattern = "*",
    command = [[if (winnr("$") == 3 && &filetype == "CHADTree") | q | endif]]
  }
)

require "lsp"
require "keymap"
