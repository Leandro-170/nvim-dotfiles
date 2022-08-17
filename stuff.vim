set number
set numberwidth=2
set mouse=a
let g:material_style = "deep ocean"
color material
set softtabstop=4 
set shiftwidth=4

command Breakpoint :lua require'dap'.toggle_breakpoint()
command Continue :lua require'dap'.continue()
command StepOver :lua require'dap'.step_over()
command StepInto :lua require'dap'.step_into()
command REPL :lua require'dap'.repl.open()

