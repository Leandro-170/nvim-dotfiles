local nvim_tree = require("nvim-tree")
nvim_tree.setup({
  sort_by = "extension",
  view = {
    adaptive_size = true,
    centralize_selection = true,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    -- @deprecated
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
      enable = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 35,
        height = 20,
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

local tree_view = require('nvim-tree.view')
local tree_api = require('nvim-tree.api').tree

function NvimTreeFloat()
  nvim_tree.config.view.float.enable = true
  if tree_view.is_visible() then
    tree_api.close()
    tree_api.open()
  end
end
function NvimTreeDock()
  nvim_tree.config.view.float.enable = false
  if tree_view.is_visible() then
    tree_api.close()
    tree_api.open()
  end
end
function NvimTreeIsFloating()
  return nvim_tree.config.view.float.enable
end

