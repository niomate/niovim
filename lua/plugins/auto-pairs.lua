return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup(
      {
        ignored_next_char = "[%w%.]" -- will ignore alphanumeric and `.` symbol
      }
    )
  end,
  dependencies = {
    "hrsh7th/nvim-cmp"
  }

  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
