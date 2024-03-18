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
      build = "make"
    },
    "benfowler/telescope-luasnip.nvim",
    -- UI stuff
    {"ms-jpq/chadtree", branch = "chad", build = ":CHADdeps"},
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
    {
      "Pocco81/true-zen.nvim",
      config = function()
        require("true-zen").setup {
          config = {
            zen_mode = "truezen"
          }
        }
      end
    },
    "folke/twilight.nvim",
    "folke/trouble.nvim",
    "folke/flash.nvim",
    -- Completion
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
    -- "ggandor/leap.nvim",
    "easymotion/vim-easymotion",
    -- Note-taking
    {
      "nvim-neorg/neorg",
      build = ":Neorg sync-parsers",
      dependencies = "nvim-lua/plenary.nvim"
    },
    -- Extra LSP tools
    "simrat39/rust-tools.nvim",
    "p00f/clangd_extensions.nvim",
    "lervag/vimtex",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "airblade/vim-rooter"
  }
)
