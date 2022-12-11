" General stuff goes here because i can't be bothered to type 'vim.cmd(blabla)' over and over again on the lua file only to have it not work
set number
set numberwidth=2
set mouse=a
let g:material_style = "deep ocean"
color material
set softtabstop=4 
set shiftwidth=4
set expandtab
set nocompatible

if has('filetype')
    filetype indent plugin on
endif

set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
" set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>

"command Breakpoint :lua require'dap'.toggle_breakpoint()
"command Continue :lua require'dap'.continue()
"command StepOver :lua require'dap'.step_over()
"command StepInto :lua require'dap'.step_into()
"command REPL :lua require'dap'.repl.open()

