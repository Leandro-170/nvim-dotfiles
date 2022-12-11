require('plugins')
require('setupcmp')
require('setupmaterial')
require('setupnvimtree')
require('setuplualine')

require'nvim-treesitter.configs'.setup
{
  ensure_installed = { "c", "lua", "cpp" },
  highlight = 
  {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

local cmd = vim.cmd
local set = vim.cmd.set
local color = vim.cmd.colorscheme
local global = vim.g

--cmd 'echo "I love Frums"'
set 'number'
set 'numberwidth=1'
set 'mouse=a'
global.material_style = "palenight"
color 'material'

set 'softtabstop=4'
set 'shiftwidth=4'
cmd 'command! -nargs=0 Tab2 set softtabstop=2 shiftwidth=2'
cmd 'command! -nargs=0 Tab4 set softtabstop=4 shiftwidth=4'

set 'expandtab'
set 'nocompatible'

cmd 'filetype indent plugin on'

set 'hidden'
set 'wildmenu'
set 'showcmd'
set 'hlsearch'
set 'ignorecase'
set 'smartcase'
set 'backspace=indent,eol,start'
--set 'autoindent'
set 'nostartofline'
set 'ruler'
set 'laststatus=2'
set 'confirm'
set 'visualbell'
-- set 'cmdheight=2'
set 'notimeout ttimeout ttimeoutlen=200'
set 'pastetoggle=<F11>'

