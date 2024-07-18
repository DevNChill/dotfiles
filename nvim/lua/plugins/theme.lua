return {
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		config = function()
			require("tokyonight").setup({
				terminal_colors = true,
			})
		end,
	},
	{
		"dasupradyumna/midnight.nvim",
		lazy = false,
		config = function()
			-- Add configuration for the midnight theme if needed
		end,
	},
}
