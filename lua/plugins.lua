local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require 'packer'

packer.init({
  display = {
    open_fn = require('packer.util').float
  }
})

packer.startup(function(use)

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
  use 'folke/neodev.nvim'

  if packer_bootstrap then
    packer.sync()
  end

end)

