require("nvim-tree").setup({
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
      enable = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
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
    dotfiles = true,
  },
})

