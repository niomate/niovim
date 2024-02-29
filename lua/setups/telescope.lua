require("telescope").setup {
  defaults = {
    preview = {
      treesitter = false
    }
  }
}
require("telescope").load_extension("fzf")
require("telescope").load_extension("luasnip")
