vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-S-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S-v>', '<C-r>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-S-v>', '"+p', { noremap = true, silent = true })

