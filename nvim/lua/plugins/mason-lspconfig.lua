local opts = {
  ensure_installed = {
    "efm",
    "bashls",
    "solidity",
    "lua_ls",
    "emmet_ls",
    "jsonls",
    "clangd",
  },
  automatic_installation = true,
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function(_, opts)
    require('mason').setup()
    require('mason-lspconfig').setup(opts)

    local nvim_lsp = require('lspconfig')

    -- Define formatting commands
    local clang_format = {
      formatCommand = "clang-format -style=GNU",
      formatStdin = true
    }

    local lua_format = {
      formatCommand = "lua-format -i",
      formatStdin = true
    }

    -- Setup EFM with specific configurations for Lua and C/C++
    nvim_lsp.efm.setup {
      init_options = { documentFormatting = true },
      filetypes = { "c", "cpp", "lua" },
      settings = {
        rootMarkers = { ".git/" },
        languages = {
          c = { clang_format },
          cpp = { clang_format },
          lua = { lua_format },
        },
      },
    }

    -- Setup other language servers
    -- These are set up but not configured to format files
    -- nvim_lsp.bashls.setup{}
    -- nvim_lsp.solidity.setup{}
    -- nvim_lsp.lua_ls.setup{}
    -- nvim_lsp.emmet_ls.setup{}
    -- nvim_lsp.jsonls.setup{}
    -- nvim_lsp.clangd.setup{}
  end,
}

