local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspkind = require('lspkind')

lspconfig['ccls'].setup
{
  capabilities = capabilities;
  init_options = {
    highlight = {
      lsRanges = true;
    };
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
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
