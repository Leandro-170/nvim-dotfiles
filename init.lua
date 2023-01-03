
local has = vim.fn["has"]
local exists = vim.fn["exists"]

if has('nvim-0.8') == 0 then
  error("Neovim 0.8+ is required")
end

if exists('g:neovide') then
  vim.cmd.set("guifont=CozetteVector:h9")
end

-- Plugins and configurations for them
require('plugins')
require('setup')
require('ui')

local cmd = vim.cmd
local set = vim.cmd.set
local color = vim.cmd.colorscheme
local global = vim.g
local command = function(s) vim.cmd.command({ bang = true, args = { s } }) end
local autocmd = function(event, pattern, callback) vim.api.nvim_create_autocmd(event, {pattern = pattern, callback = callback}) end

--cmd 'echo "I love Frums"'
set 'number'
set 'numberwidth=1'
set 'mouse=a'
global.material_style = "deep ocean"
color 'material'

set 'softtabstop=4'
set 'shiftwidth=4'
command '-nargs=1 TabSet set softtabstop=<args> shiftwidth=<args>'

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
set 'updatetime=2500'

-- lsp stuff
command 'LSPDefinition lua vim.lsp.buf.definition()'
command 'LSPTypeDefinition lua vim.lsp.buf.type_definition()'
command 'LSPDeclaration lua vim.lsp.buf.declaration()'
command 'LSPHover lua vim.lsp.buf.hover({focusable = false})'
command 'LSPReferences lua vim.lsp.buf.references()'
command 'LSPRename lua vim.lsp.buf.rename()'

command 'NvimTreeFloat lua NvimTreeFloat()'
command 'NvimTreeDock lua NvimTreeDock()'

autocmd({ "CursorHold" }, "*", function() vim.lsp.buf.hover({focusable = false}) end)

-- Make tabs not show up above nvim-tree
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

