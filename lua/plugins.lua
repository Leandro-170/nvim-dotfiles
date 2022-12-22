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
  use 'yggdroot/indentline'
  use 'nvim-lualine/lualine.nvim'
  use 'dracula/vim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use{'mg979/vim-visual-multi', branch = 'master'}
  use 'airblade/vim-gitgutter'
  use 'romgrk/barbar.nvim'

end)

