require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use "neovim/nvim-lspconfig"

    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    use "nvim-telescope/telescope.nvim"

    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }

    use "nvim-lua/plenary.nvim"

    use {"ms-jpq/chadtree", branch = "chad", run = ":CHADdeps"}
    use {"ms-jpq/coq.artifacts", branch = "artifacts"}
    use {"ms-jpq/coq.thirdparty", branch = "3p"}
    use {"ms-jpq/coq_nvim", branch = "coq", run = ":COQdeps"}

    use "romgrk/nvim-treesitter-context"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    use "rafi/awesome-vim-colorschemes"

    use "SmiteshP/nvim-gps"
    use "stevearc/dressing.nvim"
    use "svermeulen/vim-cutlass"
    use "svermeulen/vim-subversive"

    use "michaeljsmith/vim-indent-object"

    use "godlygeek/tabular"

    use "chaoren/vim-wordmotion"

    use "easymotion/vim-easymotion"

		use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use "kosayoda/nvim-lightbulb"
    use "kyazdani42/nvim-web-devicons"
    use "weilbith/nvim-code-action-menu"

    use "tpope/vim-markdown"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "Matt-A-Bennett/surround-funk.vim"

    use "airblade/vim-gitgutter"
    use "airblade/vim-rooter"

    use "voldikss/vim-floaterm"

    use "jiangmiao/auto-pairs"

    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    use "jakewvincent/texmagic.nvim"

    use {"tanvirtin/vgit.nvim", config = [[require("vgit").setup()]]}

    use "famiu/bufdelete.nvim"

    use "b3nj5m1n/kommentary"

    use "mhartington/formatter.nvim"

    use "gbprod/substitute.nvim"
  end
)
