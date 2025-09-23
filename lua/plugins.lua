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
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      appearance = {
        nerd_font_variant = 'normal'
      },
      completion = {
      documentation = { auto_show = true }, 
      menu = {
        border = "rounded",
        scrollbar = true,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" }
          },
          components = {
            kind_icon = {
              text = function(ctx)
              local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then icon = dev_icon end
                else icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol", }) end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then hl = dev_hl end
                end
                return hl
              end,
            },
          },
        },
      },
      },
      sources = { default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline' } },
      snippets = { preset = 'vsnip' },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
  'marko-cerovac/material.nvim',
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

