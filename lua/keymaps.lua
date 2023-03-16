NORMAL = 'n'
INSERT = 'i'
VISUAL = 'v'
COMMAND = 'c'

function keymaps(tbl)
  for index, value in pairs(tbl) do
    local mode = {}
    for _, mv in pairs(value.mode) do
      table.insert(mode, mv)
    end
    local key = index
    local thing = value[1]
    local opt = value[2] or {}
    vim.keymap.set(mode, key, thing, opt)
  end
end
