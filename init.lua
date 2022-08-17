vim.cmd([[ runtime plugins.vim ]])
vim.cmd([[ runtime airline.vim ]])
require('setupcmp')
require('setupmaterial')
require('setupnvimtree')
vim.cmd([[ runtime stuff.vim ]])

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "cpp" },
    highlight = { 
    	enable = true,
	additional_vim_regex_highlighting = false,
    },
}
