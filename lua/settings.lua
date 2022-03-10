vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

vim.opt.completeopt={'menuone','noinsert','noselect','preview'}

vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.shortmess:append({ c = true })

--Automatically refresh files when they are changed outside the buffer
vim.opt.autoread = true

--Search configuration
vim.opt.ignorecase = true                    --ignore case when searching
vim.opt.smartcase = true                     --turn on smartcase

vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2

vim.opt.linebreak= true
vim.opt.scrolloff=5

vim.opt.updatetime=300
vim.opt.cmdheight=2
vim.opt.signcolumn= 'yes'

--Use system clipboard
vim.opt.clipboard='unnamedplus'

vim.opt.foldmethod='expr'
vim.opt.foldexpr='nvim_treesitter#foldexpr()'
vim.opt.foldlevel=1

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.scroll = 5

--Start completion
vim.api.nvim_set_var('coq_settings', { auto_start = 'shut-up' })

vim.cmd [[colorscheme gruvbox]]
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
-- Autoclose if CHADtree is last window open
vim.cmd [[autocmd BufEnter * if (winnr("$") == 1 && &filetype == "CHADTree") | q | endif]]

-- Remove trailing whitespaces
vim.cmd [[autocmd BufWritePre * %s/\s\+$//e]]

vim.g.dashboard_default_executive = "fzf"
