return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup {
      direction = "float",
			open_mapping = [[<leader>ft]],
      float_opts = {
        border = "curved",
				height = 30,
				width = 100
      },
			name = "zsh"
  }
  end
}
