
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
require('keymaps')

local cmd = vim.cmd
local set = vim.cmd.set
local color = vim.cmd.colorscheme
local command = function(s) vim.cmd.command({ bang = true, args = { s } }) end
local autocmd = function(event, pattern, callback) vim.api.nvim_create_autocmd(event, {pattern = pattern, callback = callback}) end

--cmd 'echo "I love Frums"'
set 'number'
set 'numberwidth=1'
set 'mouse=a'
--global.material_style = "deep ocean"
--color 'material'
color 'catppuccin-mocha'

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
command 'LSPCodeAction lua vim.lsp.buf.code_action()'

autocmd({ "CursorHold" }, "*", function() vim.lsp.buf.hover({focusable = false}) end)

keymaps
{
  ['<C-t>']     = { mode = { NORMAL, INSERT }, "<cmd>Trouble<CR>"        },
  ['<C-e>']     = { mode = { NORMAL, INSERT }, "<cmd>NvimTreeToggle<CR>" },
  ['<F2>']      = { mode = { NORMAL },         "<cmd>LSPRename<CR>"      },
  ['<F3>']      = { mode = { NORMAL },         "<cmd>LSPDeclaration<CR>" },
  ['<F4>']      = { mode = { NORMAL },         "<cmd>LSPDefinition<CR>"  },
  ['<F5>']      = { mode = { NORMAL },         "<cmd>LSPCodeAction<CR>"  },
  ['<C-d>']     = { mode = { INSERT },         "<ESC>yyPi"               },
  ['<C-Tab>']   = { mode = { NORMAL },         "<cmd>BufferNext<CR>"     },
  ['<C-S-Tab>'] = { mode = { NORMAL },         "<cmd>BufferPrevious<CR>" },
}

