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
  use 'williamboman/nvim-lsp-installer'
  use 'akinsho/toggleterm.nvim'
  use "folke/lua-dev.nvim"
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use "projekt0n/github-nvim-theme"
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
end)
