-- LEADER
vim.g.mapleader = " "

-- HISTORY
vim.api.nvim_set_keymap('n', 'U', '<C-r>', { noremap = true })

-- NAVIGATION KEYS NORMAL MODE
vim.api.nvim_set_keymap('n', ';', 'l', { noremap = true })
vim.api.nvim_set_keymap('n', 'ů', 'l', { noremap = true })
vim.api.nvim_set_keymap('n', 'l', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true })

vim.api.nvim_set_keymap('n', '"', ':', { noremap = true })

-- WINDOW MANAGEMENT
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-;>', '<C-w>l', { silent = true })

-- EXIT TERMINAL
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- NAVIGATION KEYS VISUAL MODE
vim.api.nvim_set_keymap('v', ';', 'l', { noremap = true })
vim.api.nvim_set_keymap('v', 'l', 'k', { noremap = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true })
vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true })

-- MOVE
vim.keymap.set("v", "L", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "<leader>ii", "%")

-- COPY
vim.keymap.set("v", "y", "\"+y")

-- INDENT
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- TELESCOPE
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>gg", "<cmd>Telescope git_files<cr>")

-- RENINITIALIZE
vim.keymap.set("n", "<leader>RR", function()
    vim.cmd("source $MYVIMRC") -- reload init.lua
end, { desc = "Reload config and plugins" })
