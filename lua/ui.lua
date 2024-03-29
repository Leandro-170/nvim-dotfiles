local barbar    = require('bufferline') -- at line 5
local material  = require('material')   -- at line 76
local lualine   = require('lualine')    -- at line 141
local nvim_tree = require('nvim-tree')  -- at line 182
local true_zen  = require('true-zen')   -- at line 243
local indentl   = require('ibl')

barbar.setup
{
  animation = true,
  auto_hide = false,
  tabpages = false,
  clickable = true,
  focus_on_close = 'left',
  hide = {extensions = false, inactive = false},
  highlight_alternate = false,
  highlight_inactive_file_icons = false,
  highlight_visible = true,
  icons = {
    buffer_index = false,
    buffer_number = false,
    button = '✕',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ''},
      [vim.diagnostic.severity.WARN] = {enabled = false},
      [vim.diagnostic.severity.INFO] = {enabled = false},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      custom_colors = false,
      enabled = true,
    },
    separator = {left = '', right = ''},
    modified = {button = '●'},
    pinned = {button = '※', filename = true, separator = {right = ''}},
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = false},
    inactive = {button = '×',separator = {left = '', right = ''}},
    visible = {modified = {buffer_number = false}},
  },
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  semantic_letters = true,
  sidebar_filetypes = {
    NvimTree = {text = 'nvim-tree'},
    undotree = {text = 'undotree'},
    ['neo-tree'] = {event = 'BufWipeout'},
    Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
  },
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = "Ничто.",
}

material.setup({
  contrast = {
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = true, -- Enable contrast for floating windows
    line_numbers = false, -- Enable contrast background for line numbers
    sign_column = false, -- Enable contrast background for the sign column
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable darker background for non-current windows
    popup_menu = true, -- Enable lighter background for the popup menu
  },

  italics = {
    comments = true, -- Enable italic comments
    keywords = false, -- Enable italic keywords
    functions = false, -- Enable italic functions
    strings = false, -- Enable italic strings
    variables = false -- Enable italic variables
  },

  contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
    "terminal", -- Darker terminal background
    "packer", -- Darker packer background
    "qf" -- Darker qf list background
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = false -- Enable higher contrast text for darker style
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false -- Hide the end-of-buffer lines
  },

  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_highlights = {}, -- Overwrite highlights with your own

  plugins = { -- Here, you can disable(set to false) plugins that you don't use or don't want to apply the theme to
    trouble = false,
    nvim_cmp = true,
    neogit = false,
    gitsigns = false,
    git_gutter = true,
    telescope = false,
    nvim_tree = true,
    sidebar_nvim = true,
    lsp_saga = true,
    nvim_dap = true,
    nvim_navic = true,
    which_key = true,
    sneak = true,
    hop = true,
    indent_blankline = true,
    nvim_illuminate = true,
    mini = true,
  },
})

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'diagnostics'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

nvim_tree.setup({
  sort_by = "extension",
  view = {
    adaptive_size = true,
    centralize_selection = true,
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = {
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 15,
        height = 15,
        row = 1,
        col = 1,
      },
    },
  },
  git = {
    enable = true,
    ignore = false
  },
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "→",
          arrow_open = "↘",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

true_zen.setup()

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

indentl.setup { indent = { highlight = highlight } }

