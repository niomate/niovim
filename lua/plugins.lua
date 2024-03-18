-- Bootstrap

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(
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
    use {"benfowler/telescope-luasnip.nvim"}

    -- UI stuff
    use {"ms-jpq/chadtree", branch = "chad", run = ":CHADdeps"}
    use "rafi/awesome-vim-colorschemes"
    use "stevearc/dressing.nvim"
    use {"akinsho/bufferline.nvim", typ = "v2.*", requires = "kyazdani42/nvim-web-devicons"}
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "airblade/vim-gitgutter"
    use "voldikss/vim-floaterm"
    use "kosayoda/nvim-lightbulb"
    use "kyazdani42/nvim-web-devicons"
    use "famiu/bufdelete.nvim"
    use "lukas-reineke/indent-blankline.nvim"

    use {"aznhe21/actions-preview.nvim"}
    use {
      "Pocco81/true-zen.nvim",
      config = function()
        require("true-zen").setup {
          config = {
            zen_mode = "truezen"
          }
        }
      end
    }

    use {"folke/twilight.nvim"}
    use {"folke/trouble.nvim"}

    -- Completion
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-calc"
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
    use "gbprod/substitute.nvim"
    use "michaeljsmith/vim-indent-object"
    use "godlygeek/tabular"
    use "b3nj5m1n/kommentary"
    use "unblevable/quick-scope"
		use "jiangmiao/auto-pairs"

		-- use "ggandor/leap.nvim"
    use "easymotion/vim-easymotion"

    -- Note-taking
    use {
      "nvim-neorg/neorg",
      run = ":Neorg sync-parsers",
      requires = "nvim-lua/plenary.nvim"
    }

    -- Extra LSP tools
    use "simrat39/rust-tools.nvim"
    use "p00f/clangd_extensions.nvim"

    use "lervag/vimtex"

    use "junegunn/fzf"
    use "junegunn/fzf.vim"

    use "airblade/vim-rooter"
  end
)
