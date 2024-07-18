return {
	"numToStr/Comment.nvim",
	opts = {
		toggler = {
			line = "gtc",
			block = "gtb",
		},
		opleader = {
			line = "goc",
			block = "gob",
		},
	},
	config = function(_, opts)
		require("Comment").setup(opts)
	end,
}
