return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure({})
		-- Set custom highlight groups
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3e4451", underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3e4451", underline = true })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3e4451", underline = true })
	end,
}
