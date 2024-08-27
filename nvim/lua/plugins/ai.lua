return {
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	-- {
	-- 	"robitx/gp.nvim",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		require("gp").setup({
	-- 			openai_api_key = os.getenv("OPEN_API_KEY"),
	--        model = "text-davinci-003",
	-- 		})
	-- 		-- Example key mappings for gp.nvim
	-- 		vim.api.nvim_set_keymap("n", "<Leader>pt", "<Cmd>GpChatToggle popup<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("n", "<Leader>pf", "<Cmd>GpChatRespond<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("n", "<Leader>pr", "<Cmd>GpChatNew popup<CR>", { noremap = true, silent = true })
	-- 	end,
	-- },
}
