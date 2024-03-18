local map = function(key)
  -- get the extra options
  local opts = {}
  for i, v in pairs(key) do
    if type(i) == "string" then
      opts[i] = v
    end
  end
  vim.keymap.set(key[1], key[2], key[3], opts)
  -- vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
end

-- Go to first and last characters in line
map {"", "<space>l", "$"}
map {"", "<space>h", "^"}

-- Prevent accidentally going into Ex mode
map {"", "Q", "<esc>"}

-- Faster exiting from insert mode
map {"i", "jk", "<esc>"}
map {"n", "gh", ":w<cr>"}

-- Stop highlighting search results
map {"n", "<A-h>", ":nohlsearch<cr>", silent = true}

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

-- Vim-subversive bindings
map {"n", "<space>s", "<Plug>(SubversiveSubstituteLine)"}
map {"n", "<space>S", "<Plug>(SubversiveSubstituteToEndOfLine)"}

map {{"n", "x"}, "<leader>s", "<Plug>(SubversiveSubstituteRange)"}
map {"n", "<leader>ss", "<Plug>(SubversiveSubstituteWordRange)"}

map {"", "<leader>ca", require("actions-preview").code_actions, silent = true}

-- File search
map {"n", "<leader>ff", "<cmd>Telescope find_files<cr>", noremap = true}
map {"n", "<leader>fg", "<cmd>Telescope live_grep<cr>", noremap = true}
map {"n", "<leader>fb", "<cmd>Telescope buffers<cr>", noremap = true}

-- String search
map {"n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", noremap = true}
map {"n", "<leader>fc", "<cmd>Telescope grep_string<cr>", noremap = true}

map {"n", "<leader>fe", "<cmd>CHADopen<cr>", noremap = true}

-- Diagnostics
map {"n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", noremap = true}
map {"n", "<leader>fD", "<cmd>Telescope diagnostics bufnr=0<cr>", noremap = true}
map {"n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>"}
map {"n", "gdp", "<cmd>lua vim.diagnostic.goto_prev()<cr>"}
map {"n", "gdn", "<cmd>lua vim.diagnostic.goto_next()<cr>"}
map {"n", "K", "<cmd> lua vim.lsp.buf.hover()<cr>"}

	-- LSP queries
	map {"n", "<leader>fw", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", noremap = true}
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

-- LuaSnip Keymaps
local ls = require "luasnip"

map {
  {"i", "s"},
  "<M-j>",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
  silent = true
}

-- Trouble keymap
map {
  "n",
  "<leader>xx",
  function()
    require("trouble").toggle()
  end
}
map {
  "n",
  "<leader>xw",
  function()
    require("trouble").toggle("workspace_diagnostics")
  end
}
map {
  "n",
  "<leader>xd",
  function()
    require("trouble").toggle("document_diagnostics")
  end
}
map {
  "n",
  "<leader>xq",
  function()
    require("trouble").toggle("quickfix")
  end
}
map {
  "n",
  "<leader>xl",
  function()
    require("trouble").toggle("loclist")
  end
}
map {
  "n",
  "gR",
  function()
    require("trouble").toggle("lsp_references")
  end
}

map {
  "n",
  "<leader>xn",
  function()
    require("trouble").next({skip_groups = true, jump = true})
  end
}
map {
  "n",
  "<leader>xp",
  function()
    require("trouble").previous({skip_groups = true, jump = true})
  end
}

-- Exit from terminal mode
map {"t", "<Esc>", "<C-\\><C-n>", noremap = true}

-- Write to read only files
map {"c", "w!!", "execute 'silent! write !sude tee % >/dev/null' <bar> edit!", noremap = true}

map {"n", "<space>cc", "<plug>(vimtex-cmd-create)", noremap = true}

vim.g.floaterm_keymap_toggle = "<leader>tt"
