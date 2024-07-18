-- Set leader key
vim.g.mapleader = " "

-- Function to compile and run the current C++ file using ToggleTerm
function RunCppProgram()
    -- Save the current file
    vim.cmd("write")

    -- Get the full path of the current file
    local current_file_with_ext = vim.fn.expand("%:p")
    local current_file = vim.fn.expand("%:r")
    local current_dir = vim.fn.expand("%:p:h")
    local executable_path = current_dir .. "/" .. vim.fn.fnamemodify(current_file, ":t")

    -- Initialize additional flags
    local additional_flags = ""

    -- Commonly used libraries and flags in C++
    local common_libraries = {
        {name = "pthread", check = "#include <thread>"},  -- POSIX Threads library
        -- Add more libraries as needed
    }

    -- Check for each library and add corresponding flag if used
    for _, lib in ipairs(common_libraries) do
        if vim.fn.search(lib.check, "nw") > 0 then
            additional_flags = additional_flags .. " -l" .. lib.name
        end
    end

    -- Compile and run the C++ file inside ToggleTerm
    local compile_cmd = "g++ -Wall -g "
        .. current_file_with_ext
        .. " -o "
        .. executable_path
        .. additional_flags  -- Include additional flags here
        .. " && clear && ./"
        .. vim.fn.fnamemodify(current_file, ":t")
    local cmd = "cd " .. current_dir .. " && " .. compile_cmd .. "; exec $SHELL"

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

-- Map the function to <Leader>rcp for C++
vim.api.nvim_set_keymap("n", "<Leader>rcp", ":lua RunCppProgram()<CR>", { noremap = true, silent = true })

-- Return the module for Neovim to load
return {}
