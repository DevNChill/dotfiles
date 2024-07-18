return {
	"ThePrimeagen/harpoon",
	lazy = false,
	config = function()
		require("harpoon").setup({
			-- Your Harpoon configuration here
		})

		-- Example keymaps for Harpoon
		vim.api.nvim_set_keymap(
			"n",
			"<leader>a",
			":lua require('harpoon.mark').add_file()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-e>",
			":lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-i>",
			":lua require('harpoon.ui').nav_file(1)<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-o>",
			":lua require('harpoon.ui').nav_file(2)<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-[>",
			":lua require('harpoon.ui').nav_file(3)<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<C-]>",
			":lua require('harpoon.ui').nav_file(4)<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
