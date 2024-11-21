local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local lazy = require 'lazy'

lazy.setup({
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'marko-cerovac/material.nvim',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  'onsails/lspkind.nvim',
  'morhetz/gruvbox',
  -- 'flazz/vim-colorschemes',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-lualine/lualine.nvim',
  'dracula/vim',
  'christianchiarulli/nvcode-color-schemes.vim',
  'nvim-treesitter/nvim-treesitter',
  'nvim-tree/nvim-web-devicons',
  'nvim-tree/nvim-tree.lua',
  {'mg979/vim-visual-multi', branch = 'master'},
  'airblade/vim-gitgutter',
  'tpope/vim-fugitive',
  'romgrk/barbar.nvim',
  {'catppuccin/nvim', name = 'catppuccin'},
  'Pocco81/true-zen.nvim',
  'folke/trouble.nvim',
  'folke/neodev.nvim',
  'lewis6991/impatient.nvim',
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  }
},
{
  ui = {
    border = "rounded"
  }
})

