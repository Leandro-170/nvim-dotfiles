require('packer').init({
  display = {
    open_fn = require('packer.util').float
  }
})

require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'marko-cerovac/material.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'
  use 'morhetz/gruvbox'
  --use 'flazz/vim-colorschemes'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'dracula/vim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use{'mg979/vim-visual-multi', branch = 'master'}
  use 'airblade/vim-gitgutter'
  use 'romgrk/barbar.nvim'
  use{'catppuccin/nvim', as = 'catppuccin'}
  use 'Pocco81/true-zen.nvim'
  use 'folke/trouble.nvim'
  use
  {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text'
  }
  use 'nvim-lua/plenary.nvim'
  use 'Civitasv/cmake-tools.nvim'

end)

