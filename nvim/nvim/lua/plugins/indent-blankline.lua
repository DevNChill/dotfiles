return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	lazy = false,
	config = function()
		require("ibl").setup()
	end,
	opts = {},
}
