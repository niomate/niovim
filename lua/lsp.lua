local nvim_lsp = require("lspconfig")

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gdc", "<cmd>Telescope lsp_declarations<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gdf", "<cmd>Telescope lsp_definitions<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gtd", "<cmd>Telescope lsp_type_definitions<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<cr>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches'cssls'
local servers = {
  "pyright",
  "rust_analyzer",
  "bashls",
  "vimls",
  "clangd",
  "texlab",
  "metals",
  "sumneko_lua",
  "html",
  "cssls"
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end
