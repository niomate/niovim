-- Bootstrap
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP =
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

require("packer").startup(
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Basics
    use "neovim/nvim-lspconfig"
    use "mhartington/formatter.nvim"

    -- Telescope stuff
    use "nvim-telescope/telescope.nvim"
    use "nvim-lua/plenary.nvim"
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make"
    }

    -- UI stuff
    use {"ms-jpq/chadtree", branch = "chad", run = ":CHADdeps"}
    use "rafi/awesome-vim-colorschemes"
    use "stevearc/dressing.nvim"
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "airblade/vim-gitgutter"
    use "voldikss/vim-floaterm"
    use "kosayoda/nvim-lightbulb"
    use "kyazdani42/nvim-web-devicons"
    use "weilbith/nvim-code-action-menu"
    use "famiu/bufdelete.nvim"

    -- Completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "kdheepak/cmp-latex-symbols"
    use "onsails/lspkind-nvim"
    use "hrsh7th/nvim-cmp"

		-- Snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
		use "rafamadriz/friendly-snippets"

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "romgrk/nvim-treesitter-context"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Editing
    use "tpope/vim-markdown"
    use "tpope/vim-repeat"
    use "tpope/vim-surround"
    use "svermeulen/vim-cutlass"
    use "svermeulen/vim-subversive"
    use "chaoren/vim-wordmotion"
    use "easymotion/vim-easymotion"
    use "gbprod/substitute.nvim"
    use "jiangmiao/auto-pairs"
    use "michaeljsmith/vim-indent-object"
    use "godlygeek/tabular"
    use "b3nj5m1n/kommentary"

    -- Extra LSP tools
    use "simrat39/rust-tools.nvim"
    use "p00f/clangd_extensions.nvim"

    use "jakewvincent/texmagic.nvim"

    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    use "airblade/vim-rooter"

		-- ROS stuff
		use "taketwo/vim-ros"
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)
