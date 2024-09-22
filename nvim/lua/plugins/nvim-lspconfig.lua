-- Css is working

vim.lsp.set_log_level("debug")
local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs
local typescript_organise_imports = require("util.lsp").typescript_organise_imports

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- Lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- Bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh", "bash" },
	})

	-- Solidity
	lspconfig.solidity.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "solidity" },
	})

	-- Docker
	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- C/C++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
		settings = {
			clangd = {
				extraArgs = {
					"-I/usr/include",
				},
			},
		},
	})

	-- HTML
	lspconfig.html.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = { "vscode-html-language-server", "--stdio" },
		filetypes = { "html", "htmldjango" },
		settings = {
			html = {
				validate = true,
				format = {
					enable = true,
				},
				hover = {
					enable = true,
				},
				completion = {
					enable = true,
				},
			},
		},
	})

	-- CSS
	lspconfig.cssls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			scss = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			less = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
	})

	-- JavaScript
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			javascript = {
				format = {
					enable = true,
				},
			},
		},
	})

	-- Configure efm server
	local stylelint = require("efmls-configs.linters.stylelint")
	local prettier = require("efmls-configs.formatters.prettier")
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")
	local eslint = require("efmls-configs.linters.eslint")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local hadolint = require("efmls-configs.linters.hadolint")
	local solhint = require("efmls-configs.linters.solhint")
	local cpplint = require("efmls-configs.linters.cpplint")
  local htmlhint = require("efmls-configs.linters.htmlhint")

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"py",
			"json",
			"jsonc",
			"sh",
			"scss",
			"less",
			"svelte",
			"vue",
			"markdown",
			"docker",
			"solidity",
			"html",
			"css",
			"c",
			"cpp",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint, prettier },
				json = { eslint, fixjson },
				jsonc = { eslint, fixjson },
				sh = { shellcheck, shfmt },
				javascript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				typescriptreact = { eslint, prettier },
				svelte = { eslint, prettier },
				vue = { eslint, prettier },
				markdown = { prettier },
				docker = { hadolint, prettier },
				solidity = { solhint },
				html = {htmlhint, prettier },
				css = { stylelint, prettier },
				c = { cpplint },
				cpp = { cpplint },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
	},
}
