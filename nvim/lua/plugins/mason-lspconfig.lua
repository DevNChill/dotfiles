local opts = {
	ensure_installed = {
		"html",
		-- "js-debug-adapter",
		"cssls",
		"tailwindcss",
		"svelte",
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
	},
}
