require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "python", "rust","vim"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	auto_install = true,
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
	incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}
