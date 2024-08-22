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
                additional_args = function(_)
                    return { "--hidden", "--no-ignore-vcs" }
                end,
                cwd = "~",
                hidden = true,
                no_ignore = true,
            },
            find_files = {
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
                additional_args = function(_)
                    return { "--hidden", "--no-ignore-vcs" }
                end,
                no_ignore = true,
                hidden = true,
                cwd = "~",
                sorting_strategy = "ascending",
            },
        },
        extensions = {
            "fzf",
        },
    })
    telescope.load_extension("fzf")
end
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = config,
}

