return {
	"stevearc/overseer.nvim",
	event = "BufEnter",
	opts = {
		-- Add language-specific commands here
		templates = {
			{
				name = "C/C++ Build",
				description = "Build C/C++ files",
				command = "make",
				args = {},
				cwd = "${file_dir}",
				condition = {
					filetype = { "c", "cpp" },
				},
			},
			{
				name = "Python Run",
				description = "Run Python files",
				command = "python3",
				args = { "${file}" },
				cwd = "${file_dir}",
				condition = {
					filetype = { "python" },
				},
			},
			{
				name = "JavaScript Run",
				description = "Run JavaScript files",
				command = "node",
				args = { "${file}" },
				cwd = "${file_dir}",
				condition = {
					filetype = { "javascript" },
				},
			},
		},
	},
	config = function()
		require("overseer").setup()
	end,
}
