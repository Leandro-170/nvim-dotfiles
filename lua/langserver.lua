local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspkind = require('lspkind')

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

lspconfig['ccls'].setup
{
  capabilities = capabilities;
  init_options = {
    highlight = {
      lsRanges = true;
    };
    compilationDatabaseDirectory = "build";
    index = {
      threads = 12;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
    client = {
      snippetSupport = true
    }
  }
}

lspconfig.sumneko_lua.setup
{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
      -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = { enable = false, }
    }
  }
}

lspconfig.pyright.setup{}

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
