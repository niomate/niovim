return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup(
      {
        filetype = {
          lua = {
            -- luafmt
            function()
              return {
                exe = "luafmt",
                args = {"--indent-count", 2, "--stdin"},
                stdin = true
              }
            end
          },
          python = {
            -- Configuration for psf/black
            function()
              return {
                exe = "yapf", -- this should be available on your $PATH
                stdin = true
              }
            end
          },
          rust = {
            -- Configuration for rustfmt
            function()
              return {
                exe = "rustfmt", -- this should be available on your $PATH
                args = {"--emit=stdout"},
                stdin = true
              }
            end
          },
          cpp = {
            -- clang-format
            function()
              return {
                exe = "clang-format",
                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                stdin = true,
                cwd = vim.fn.expand("%:p:h") -- Run clang-format in cwd of the file.
              }
            end
          },
          json = {
            function()
              return {
                exe = "jq",
                args = {"'.'"},
                stdin = true
              }
            end
          }
        }
      }
    )
  end
}
