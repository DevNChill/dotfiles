return {
	"akinsho/toggleterm.nvim",
	version = "*",
	lazy = false,
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 16
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = "<C-b>",
			start_in_insert = true,
			insert_mappings = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- Register custom key mappings
		local function register_custom_mappings()
			local mappings = {
				{ key = "<leader>tf", cmd = "ToggleTerm direction=float" },
				{ key = "<leader>tt", cmd = "ToggleTerm direction=tab" },
				{ key = "<leader>tv", cmd = "ToggleTerm direction=vertical" },
				{ key = "<leader>th", cmd = "ToggleTerm direction=horizontal" },
			}
			for _, map in ipairs(mappings) do
				vim.api.nvim_set_keymap("n", map.key, "<cmd>" .. map.cmd .. "<CR>", { noremap = true, silent = true })
			end
		end

		register_custom_mappings()
	end,
}
