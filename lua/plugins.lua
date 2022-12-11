require('packer').startup(function(use)

  --use 'prabirshrestha/vim-lsp'
  --use 'mattn/vim-lsp-settings'
--Plug 'prabirshrestha/asyncomplete.vim'
--Plug 'prabirshrestha/asyncomplete-lsp.vim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'marko-cerovac/material.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

--Plug 'jackguo380/vim-lsp-cxx-highlight'
  use 'morhetz/gruvbox'
  use 'flazz/vim-colorschemes'
  use 'yggdroot/indentline'
--Plug 'vim-airline/vim-airline'
--Plug 'vim-airline/vim-airline-themes'
  use 'nvim-lualine/lualine.nvim'
--Plug 'yuttie/comfortable-motion.vim'
  use 'dracula/vim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
--Plug 'mfussenegger/nvim-dap'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use{'mg979/vim-visual-multi', branch = 'master'}
  use 'airblade/vim-gitgutter'

end)

