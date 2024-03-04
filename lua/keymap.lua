local map = function(key)
  -- get the extra options
  local opts = {}
  for i, v in pairs(key) do
    if type(i) == "string" then
      opts[i] = v
    end
  end
  vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

-- Go to first and last characters in line
map {"", "<space>l", "$"}
map {"", "<space>h", "^"}

-- Prevent accidentally going into Ex mode
-- map Q qq
map {"", "Q", "qq"}

-- Faster exiting from insert mode
map {"i", "jj", "<esc>"}
map {"n", "öö", ":w<cr>"}
map {"n", "ÖÖ", ":wq<cr>"}

-- Stop highlighting search results
map {"n", "<A-h>", ":nohlsearch<cr>", silent = true}

map {"", "<A-e>", ":w<cr>", silent = true}

-- "in document" (from first line to last; cursor at top--ie, gg)
map {"x", "id", ":<c-u>normal! G$Vgg0<cr>", noremap = true, silent = true}
map {"o", "id", ":<c-u>normal! GVgg<cr>", noremap = true, silent = true}

-- Need that because of vim-cutlass
map {"n", "m", "d", noremap = true}
map {"x", "m", "d", noremap = true}
map {"n", "mm", "dd", noremap = true}
map {"n", "M", "D", noremap = true}

map {"n", "<leader>bd", ":Bdelete<cr>", noremap = true, silent = true}
map {"n", "gbp", ":bprevious<cr>", noremap = true, silent = true}
map {"n", "gbn", ":bnext<cr>", noremap = true, silent = true}

-- Easymotion bindings
map {"n", "<leader>es", "<Plug>(easymotion-s2)"}
map {"n", "<leader>et", "<Plug>(easymotion-t2)"}
map {"", "<leader>j", "<Plug>(easymotion-j)"}
map {"", "<leader>k", "<Plug>(easymotion-k)"}

-- Vim-subversive bindings
map {"n", "ss", "<Plug>(SubversiveSubstituteLine)"}
map {"n", "S", "<Plug>(SubversiveSubstituteToEndOfLine)"}

map {"n", "<leader>s", "<Plug>(SubversiveSubstituteRange)"}
map {"x", "<leader>s", "<Plug>(SubversiveSubstituteRange)"}
map {"n", "<leader>ss", "<Plug>(SubversiveSubstituteWordRange)"}

map {"n", "<leader>ne", ":CHADopen<cr>", noremap = true, silent = true}

map {"", "<leader>ca", ":CodeActionMenu<cr>", silent = true}

-- File search
map {"n", "<leader>ff", "<cmd>Telescope find_files<cr>", noremap = true}
map {"n", "<leader>fg", "<cmd>Telescope live_grep<cr>", noremap = true}
map {"n", "<leader>fb", "<cmd>Telescope buffers<cr>", noremap = true}

-- String search
map {"n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", noremap = true}
map {"n", "<leader>fc", "<cmd>Telescope grep_string<cr>", noremap = true}

-- Diagnostics
map {"n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", noremap = true}
map {"n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<cr>", noremap = true}
map {"n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>"}
map {"n", "gdp", "<cmd>lua vim.diagnostic.goto_prev()<cr>"}
map {"n", "gdn", "<cmd>lua vim.diagnostic.goto_next()<cr>"}
map {"n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>"}

-- LSP queries
map {"n", "<leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", noremap = true}
map {"n", "<leader>ft", "<cmd>Telescope treesitter<cr>", noremap = true}
map {"n", "gdc", "<cmd>Telescope lsp_declarations<cr>"}
map {"n", "gdf", "<cmd>Telescope lsp_definitions<cr>"}
map {"n", "gi", "<cmd>Telescope lsp_implementations<cr>"}
map {"n", "gtd", "<cmd>Telescope lsp_type_definitions<cr>"}
map {"n", "grr", "<cmd>Telescope lsp_references<cr>"}

-- Generic
map {"n", "<leader>fq", "<cmd>Telescope quickfix<cr>", noremap = true}
map {"n", "<c-p>", "<cmd>Telescope resume<cr>", noremap = true}
map {"n", "<leader>fls", "<cmd>Telescope luasnip<cr>", noremap = true}

map {"n", "<A-j>", "10j", {}}
map {"n", "<A-k>", "10k", {}}

map {"n", "<space>f", ":Format<cr>", silent = true}

-- Jump to matching pair
map {"n", "gm", "%"}

-- Clear quickfix list
map {"n", "<leader>cq", ":cclose<cr>", noremap = true}
map {"n", "<leader>cn", ":cnext<cr>", noremap = true}
map {"n", "<leader>cp", ":cprevious<cr>", noremap = true}

-- LuaSnip Keymaps
local ls = require "luasnip"

vim.keymap.set(
  {"i"},
  "jk",
  function()
    ls.expand()
  end,
  {silent = true}
)
vim.keymap.set(
  {"i", "s"},
  "jk",
  function()
    if ls.jumpable(1) then
      ls.jump(1)
    end
  end,
  {silent = true}
)
vim.keymap.set(
  {"i", "s"},
  "kj",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  {silent = true}
)

vim.keymap.set(
  {"i", "s"},
  "<C-E>",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
  {silent = true}
)

-- Split resize
map {"n", "<leader>-v", "<cmd>vertical resize -10<cr>", noremap = true}
map {"n", "<leader>+v", "<cmd>vertical resize +10<cr>", noremap = true}
map {"n", "<leader>-h", "<cmd>horizontal resize -10<cr>", noremap = true}
map {"n", "<leader>+h", "<cmd>horizontal resize +10<cr>", noremap = true}

map {"n", "<leader>rh", "<cmd>resize<cr>", noremap = true}
map {"n", "<leader>rs", "<c-w>=", noremap = true}
map {"n", "<leader>rv", "<cmd>vertical resize<cr>", noremap = true}

-- Exit from terminal mode
map {"t", "<Esc>", "<C-\\><C-n>", noremap = true}

-- Write to read only files
map {"c", "w!!", "execute 'silent! write !sude tee % >/dev/null' <bar> edit!", noremap = true}

vim.g.floaterm_keymap_toggle = "<leader>tt"
