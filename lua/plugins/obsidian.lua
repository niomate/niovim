return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim"
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/vaults/work"
      }
    }
  }
}
