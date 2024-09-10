local config = function()
	local telescope = require("telescope")

	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
			file_ignore_patterns = {
				".config/BraveSoftware",
				"node_modules",
				".icons",
				".cargo",
				".mozilla",
				".venv",
				".cache",
				".local",
				".zshrc",
				".config/yay",
				".npm",
				".git",
				".svn",
				"__pycache__",
				"*.pyc",
				"*.pyo",
				"*.pyd",
			},
		},
		pickers = {
			live_grep = {
				additional_args = function()
					return { "--hidden", "--no-ignore-vcs" }
				end,
				cwd = "~",
				hidden = true,
				no_ignore = true,
			},
			find_files = {
				additional_args = function()
					return { "--hidden", "--no-ignore-vcs" }
				end,
				cwd = "~",
				hidden = true,
				no_ignore = true,
			},
		},
		extensions = {
			"fzf",
		},
	})

	telescope.load_extension("fzf")
end

local keys = {
	{ "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer search" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
	{ "<leader>fgf", "<cmd>Telescope find_files<cr>", desc = "Find All Files" },
	{ "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Git files" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
	{ "<leader>fj", "<cmd>Telescope command_history<cr>", desc = "History" },
	{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "<leader>fl", "<cmd>Telescope lsp_references<cr>", desc = "Lsp References" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
	{ "<leader>fdg", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep" },
	{ "<leader>fgs", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
	{ "<leader>ft", "<cmd>Telescope treesitter<cr>", desc = "Treesitter" },

	-- New keybindings with lazy loading
	{
		"<leader>fr",
		function()
			require("telescope.builtin").live_grep({ cwd = vim.fn.expand("%:p:h") })
		end,
		desc = "Ripgrep in Current Directory",
	},
	{
		"<leader>fs",
		function()
			require("telescope.builtin").grep_string({ cwd = vim.fn.expand("%:p:h") })
		end,
		desc = "String Search in Current Directory",
	},
	{
		"<leader>ff",
		function()
			require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
		end,
		desc = "Find Files in Parent Directory",
	},
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = keys,
	config = config,
}
