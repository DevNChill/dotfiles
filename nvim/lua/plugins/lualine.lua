local config = function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "buffers" }, -- Show all buffers (open files)
			lualine_c = {
				{
					"macro recording",
					fmt = function()
						local recording_register = vim.fn.reg_recording()
						if recording_register == "" then
							return ""
						else
							return "Recording @" .. recording_register
						end
					end,
					cond = function()
						return vim.fn.reg_recording() ~= ""
					end,
				},
			},
			lualine_x = { "branch", "encoding", "fileformat", "filetype", "progress" },
			lualine_y = { "" },
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = { "fugitive" }, -- Optional: add extensions if needed
	})
end

return {
	"nvim-lualine/lualine.nvim",
	event = "BufReadPost",
	config = config,
}
