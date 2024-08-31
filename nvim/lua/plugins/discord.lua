return {
	"andweeb/presence.nvim",
	event = "BufEnter",
	config = function()
		require("presence"):setup({})
	end,
}
