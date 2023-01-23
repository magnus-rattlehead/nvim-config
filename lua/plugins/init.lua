return require('packer').startup(function()
  local use = require('packer').use
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
  use {
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'
  use {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup{}
    end,
  }
  use 'folke/which-key.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'
  use { 'tami5/lspsaga.nvim', config = "require('lspsaga-config')" }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use 'lukas-reineke/indent-blankline.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'terrortylor/nvim-comment'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'akinsho/toggleterm.nvim'
  use "folke/lua-dev.nvim"
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use "github/copilot.vim"
  use "psliwka/vim-smoothie"
  use "dstein64/nvim-scrollview"
  use "frabjous/knap"
  use "mfussenegger/nvim-dap"
  use "folke/trouble.nvim"
  use "marko-cerovac/material.nvim"
  use "famiu/bufdelete.nvim"
  use "phaazon/hop.nvim"
  use "lewis6991/spellsitter.nvim"
  use "yamatsum/nvim-cursorline"
  use "tpope/vim-fugitive"
  use "mfussenegger/nvim-dap-python"
  use "glepnir/dashboard-nvim"
  use "ellisonleao/glow.nvim"
  use "ray-x/lsp_signature.nvim"
  use "simrat39/symbols-outline.nvim"
  use "EdenEast/nightfox.nvim"
  use { "mfussenegger/nvim-jdtls" }
  use "folke/neodev.nvim"
end)
