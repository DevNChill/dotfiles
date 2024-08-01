-- Function to compile and run the current C++ file using ToggleTerm
function RunCppProgram()
    -- Save the current file
    vim.cmd("write")

    -- Get the full path of the current file
    local current_file_with_ext = vim.fn.expand("%:p")
    local current_file = vim.fn.expand("%:r")
    local current_dir = vim.fn.expand("%:p:h")
    local executable_path = current_dir .. "/" .. vim.fn.fnamemodify(current_file, ":t")

    -- Check if readline functions are used in the current C++ file
    local readline_used = false
    local file_contents = vim.fn.readfile(current_file_with_ext)
    for _, line in ipairs(file_contents) do
        if line:find("readline") or line:find("add_history") then
            readline_used = true
            break
        end
    end

    -- Compile and run the C++ file inside ToggleTerm
    local compile_cmd = "g++ -Wall -g "
        .. current_file_with_ext
        .. " -o "
        .. executable_path
        .. (readline_used and " -lreadline" or "")  -- Include -lreadline if readline is used
        .. " -lm && clear && ./"
        .. vim.fn.fnamemodify(current_file, ":t")
    local cmd = "cd " .. current_dir .. " && ZDOTDIR=~/.zshrc_toggleterm zsh -c '"
        .. compile_cmd .. "; exec $SHELL'"

    -- Use ToggleTerm to open a terminal and send the command
    local Terminal = require("toggleterm.terminal").Terminal
    local cpp_program_terminal = Terminal:new({
        cmd = cmd,
        direction = "float",
        close_on_exit = false,
        on_open = function(term)
            vim.cmd("startinsert!")
        end,
    })
    cpp_program_terminal:toggle()
end

-- Map the function to <Leader>rcc
vim.api.nvim_set_keymap("n", "<Leader>rcp", ":lua RunCppProgram()<CR>", { noremap = true, silent = true })

