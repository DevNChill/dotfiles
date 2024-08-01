local function run_cpp_with_splits()
	local file = vim.fn.expand("%") -- Get the current file name
	local base_name = vim.fn.expand("%:r") -- Get the file base name without extension
	local input_file = "inputf.in"
	local output_file = "outputf.in"

	-- Open the input and output files in splits
	vim.cmd("vsplit " .. input_file)
	vim.cmd("split " .. output_file)

	-- Compile and run the C++ code
	local command = string.format(
		"g++ -std=c++14 %s -o %s && timeout 4s ./%s <%s >%s",
		file,
		base_name,
		base_name,
		input_file,
		output_file
	)
	vim.cmd("! " .. command)
end

vim.api.nvim_create_user_command("RunCppWithSplits", run_cpp_with_splits, {})
vim.api.nvim_set_keymap("n", "<leader>cp", ":RunCppWithSplits<CR>", { noremap = true, silent = true })
-- Function to close buffers twice and run the C++ function
local function close_buffers_twice_and_run_cpp()
    -- Close the current buffer twice
    vim.cmd("bdelete")
    vim.cmd("bdelete")
    
    -- Run the C++ compile and run function
    run_cpp_with_splits()
end

-- Create a Neovim command to run the sequence function
vim.api.nvim_create_user_command('CloseBuffersTwiceAndRunCpp', close_buffers_twice_and_run_cpp, {})

-- Map <leader>ci to the sequence function
vim.api.nvim_set_keymap('n', '<leader>ci', ':CloseBuffersTwiceAndRunCpp<CR>', { noremap = true, silent = true })

