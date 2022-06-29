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
  -- use 'lukas-reineke/lsp-format.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'terrortylor/nvim-comment'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  --   use({
  --     'NTBBloodbath/doom-one.nvim',
  --     config = function()
  --         require'doom-one'.setup({
  --             cursor_coloring = true,
  --             terminal_colors = true,
  --             italic_comments = false,
  --             enable_treesitter = true,
  --             transparent_background = false,
  --             pumblend = {
  --                 enable = false,
  --                 transparency_amount = 20,
  --             },
  --             plugins_integrations = {
  --                 neorg = false,
  --                 barbar = true,
  --                 bufferline = false,
  --                 gitgutter = false,
  --                 gitsigns = false,
  --                 telescope = true,
  --                 neogit = false,
  --                 nvim_tree = true,
  --                 dashboard = false,
  --                 startify = false,
  --                 whichkey = true,
  --                 indent_blankline = true,
  --                 vim_illuminate = false,
  --                 lspsaga = true,
  --             },
  --         })
  --     end,
  -- })
  use 'bluz71/vim-moonfly-colors'
  use 'folke/tokyonight.nvim'
  use 'shaunsingh/nord.nvim'
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
end)
