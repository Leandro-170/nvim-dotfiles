local neodev = require('neodev')
local impatient = require('impatient')
local lspkind = require('lspkind')
local trouble = require('trouble')

neodev.setup()

require'nvim-treesitter.configs'.setup
{
  ensure_installed = { "c", "lua", "cpp" },
  highlight =
  {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}

-- enable border for vim.lsp.buf.hover()

vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
  {"◆", "FloatBorder"},
  {"─", "FloatBorder"},
  {"◆", "FloatBorder"},
  {"│", "FloatBorder"},
  {"◆", "FloatBorder"},
  {"─", "FloatBorder"},
  {"◆", "FloatBorder"},
  {"│", "FloatBorder"},
}

local original_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return original_preview(contents, syntax, opts, ...)
end

vim.lsp.config('*', {
    root_markers = { ".git" },
    capabilities = {
      textDocument = {
        semanticTokens = {
          multilineTokenSupport = true,
        }
      }
    }
})

vim.lsp.config("ccls", {
  capabilities = capabilities;
  init_options = {
    highlight = {
      lsRanges = true;
    },
    compilationDatabaseDirectory = "build";
    index = {
      threads = 12;
    },
    clang = {
      excludeArgs = { "-frounding-math"} ;
    },
    client = {
      snippetSupport = true
    }
  }
})

vim.lsp.config("luals",
{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
        disable = {"undefined-global"}
      },
      workspace = {
      -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false, }
    }
  }
})

vim.lsp.config("pyright", {})
vim.lsp.config("arduino_language_server", {
    cmd = {
    "arduino-language-server",
    "-cli-config",
    vim.fn.expand("~/Arduino15/arduino-cli.yaml"),
    "-fqbn",
    "arduino:avr:uno",
    "-cli-daemon-addr",
    "localhost",
    "-cli-daemon-instance",
    "1",
    "-clangd",
    "/usr/bin/clangd"
    }
})

vim.lsp.enable({'ccls', 'luals', 'pyright', 'arduino-language-server'})

lspkind.init({
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'default',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "",
    Method = "⚐",
    Function = "⚑",
    Constructor = "♡",
    Field = "⏺",
    Variable = "♠",
    Class = "♦",
    Interface = "♢",
    Module = "♤",
    Property = "○",
    Unit = "☐",
    Value = "✦",
    Enum = "∃",
    Keyword = "",
    Snippet = "",
    Color = "⣿",
    File = "",
    Reference = "&",
    Folder = "",
    EnumMember = "∋",
    Constant = "∞",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
  },
})

trouble.setup()

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  presets = {
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
