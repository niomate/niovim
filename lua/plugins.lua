return require("lazy").setup(
  {
    -- Basics
    "neovim/nvim-lspconfig",
    "mhartington/formatter.nvim",
    -- Telescope stuff
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    "benfowler/telescope-luasnip.nvim",
    -- UI stuff
    "rafi/awesome-vim-colorschemes",
    "stevearc/dressing.nvim",
    {"akinsho/bufferline.nvim", dependencies = "kyazdani42/nvim-web-devicons"},
    {
      "nvim-lualine/lualine.nvim",
      dependencies = {"kyazdani42/nvim-web-devicons", opt = true}
    },
    "airblade/vim-gitgutter",
    "voldikss/vim-floaterm",
    "kosayoda/nvim-lightbulb",
    "kyazdani42/nvim-web-devicons",
    "famiu/bufdelete.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "aznhe21/actions-preview.nvim",
    "folke/twilight.nvim",
    "folke/trouble.nvim",
    -- Completion
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        {
          "s",
          mode = {"n", "x", "o"},
          function()
            require("flash").jump()
          end,
          desc = "Flash"
        },
        {
          "S",
          mode = {"n", "x", "o"},
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter"
        },
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash"
        },
        {
          "R",
          mode = {"o", "x"},
          function()
            require("flash").treesitter_search()
          end,
          desc = "Treesitter Search"
        },
        {
          "<c-s>",
          mode = {"c"},
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search"
        }
      }
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "kdheepak/cmp-latex-symbols",
    "onsails/lspkind-nvim",
    "hrsh7th/nvim-cmp",
    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "romgrk/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
    -- Editing
    "tpope/vim-markdown",
    "tpope/vim-repeat",
    "tpope/vim-surround",
    "svermeulen/vim-cutlass",
    "svermeulen/vim-subversive",
    "chaoren/vim-wordmotion",
    "gbprod/substitute.nvim",
    "michaeljsmith/vim-indent-object",
    "godlygeek/tabular",
    "b3nj5m1n/kommentary",
    "unblevable/quick-scope",
    "jiangmiao/auto-pairs",
    "easymotion/vim-easymotion",
    -- Extra LSP tools
    "simrat39/rust-tools.nvim",
    "p00f/clangd_extensions.nvim",
    "lervag/vimtex",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "airblade/vim-rooter",
    {
      "ms-jpq/chadtree",
      branch = "chad",
      build = "python3 -mchadtree deps"
    }
  }
)
