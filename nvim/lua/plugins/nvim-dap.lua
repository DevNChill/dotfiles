local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
    cmd = { "DapContinue", "DapToggleBreakpoint", "DapStepOver", "DapStepInto", "DapStepOut", "DapTerminate", "DapREPL" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Define the LLDB adapter
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/bin/lldb-vscode", -- Path to your LLDB VSCode executable
				name = "lldb",
			}

			-- Function to launch the debugger with input
			local function launch_with_input(executable)
				local input_path = vim.fn.input("Path to executable: ", executable, "file")
				if input_path ~= "" then
					return input_path
				else
					return nil -- Cancelled by user
				end
			end

			-- Configure the C and C++ debugging sessions
			dap.configurations.cpp = {
				{
					type = "lldb",
					name = "Launch with Input",
					request = "launch",
					program = function()
						return launch_with_input(vim.fn.getcwd() .. "/")
					end,
					cwd = "${workspaceFolder}", -- Set the workspace folder as the working directory
					stopOnEntry = false,
					args = {}, -- Optional: Add arguments if needed
					env = {}, -- Optional: Set environment variables if needed
				},
			}
			dap.configurations.c = dap.configurations.cpp -- Use the same configurations for C

			-- Setup dapui
			dapui.setup()

			-- Open dapui on initialized events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			-- Close dapui on terminated and exited events
			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	},
}

-- Return the plugins table
return plugins
