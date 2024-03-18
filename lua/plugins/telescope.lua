return {
  "nvim-telescope/telescope.nvim",
  config = function()
    local actions = require("telescope.actions")
    local trouble = require("trouble.providers.telescope")

    require("telescope").setup {
      defaults = {
        mappings = {
          i = {["<c-t>"] = trouble.open_with_trouble},
          n = {["<c-t>"] = trouble.open_with_trouble}
        },
        preview = {
          treesitter = false
        }
      }
    }
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("luasnip")
  end
}
