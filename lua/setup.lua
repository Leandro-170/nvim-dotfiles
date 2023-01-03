-- Setup nvim-cmp.

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local cmp = require('cmp')
local lspkind = require('lspkind')

-- Treesitter config
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

lspconfig['sumneko_lua'].setup
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
}

lspconfig['pyright'].setup{}

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

-- nvim-cmp things

vim.cmd([[ set completeopt=menu,menuone,noselect ]])
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        if vim.fn["vsnip#jumpable"](1) == 1 then
          feedkey("<Plug>(vsnip-jump-next)", "")
        else
          fallback()
        end -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        if vim.fn["vsnip#jumpable"](-1) == 1 then
            feedkey("<Plug>(vsnip-jump-previous)", "")
        else
            fallback()
        end
      end
    end, { "i", "s"}),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 175, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

