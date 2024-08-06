local config = function()
	require('nvim-ts-autotag').setup()
end

return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	ft = {
		"html",               -- Standard HTML files
		"javascript",         -- JavaScript files
		"typescript",         -- TypeScript files
		"javascriptreact",    -- JavaScript React (JSX) files
		"typescriptreact",    -- TypeScript React (TSX) files
		"vue",                -- Vue.js files
		"svelte",             -- Svelte files
		"xml",                -- XML files
		"pug",                -- Pug (Jade) template files
		"ejs",                -- EJS (Embedded JavaScript) template files
		"handlebars",         -- Handlebars template files
		"twig",               -- Twig template files
	},
	config = config,
}

