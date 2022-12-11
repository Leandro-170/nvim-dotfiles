
local has = vim.fn["has"]

if has('nvim-0.8') == 0 then
    error("Neovim 0.8+ is required")
end

-- Plugins and configurations for them
require('plugins')
require('setupcmp')
require('langserver')
require('setupmaterial')
require('setupnvimtree')
require('setuplualine')
require('setupbarbar')

-- Treesitter config
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
local command = function(s) vim.cmd.command({ bang = true, args = { s } }) end

--cmd 'echo "I love Frums"'
set 'number'
set 'numberwidth=1'
set 'mouse=a'
global.material_style = "deep ocean"
color 'material'

set 'softtabstop=4'
set 'shiftwidth=4'
cmd 'command! -nargs=1 TabSet set softtabstop=<args> shiftwidth=<args>'

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

-- lsp stuff
command 'LSPDefinition lua vim.lsp.buf.definition()'
command 'LSPTypeDefinition lua vim.lsp.buf.type_definition()'
command 'LSPDeclaration lua vim.lsp.buf.declaration()'
command 'LSPHover lua vim.lsp.buf.hover()'
command 'LSPReferences lua vim.lsp.buf.references()'
command 'LSPRename lua vim.lsp.buf.rename()'

command 'NvimTreeFloat lua NvimTreeFloat()'
command 'NvimTreeDock lua NvimTreeDock()'

-- From the barbar repo
local nvim_tree_events = require('nvim-tree.events')
local bufferline_api = require('bufferline.api')

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  if not NvimTreeIsFloating() then
    bufferline_api.set_offset(get_tree_size())
  else
    bufferline_api.set_offset(0)
  end
end)

nvim_tree_events.subscribe('Resize', function()
  if not NvimTreeIsFloating() then
    bufferline_api.set_offset(get_tree_size())
  end
end)

nvim_tree_events.subscribe('TreeClose', function()
  if not NvimTreeIsFloating() then
    bufferline_api.set_offset(0)
  end
end)

