
local has = vim.fn["has"]

if has('nvim-0.8') == 0 then
    error("Neovim 0.8+ is required")
end

require('plugins')
require('setupcmp')
require('langserver')
require('setupmaterial')
require('setupnvimtree')
require('setuplualine')
require('setupbarbar')

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
global.material_style = "deep ocean"
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
set 'list'
--☱☲☳☴
set 'listchars+=tab:⇐=⇒,trail:☵'--multispace:☱☲☳☴'

-- From the barbar repo
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

