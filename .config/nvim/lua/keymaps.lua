local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Follow tags
keymap('n', 't', '<C-]>', opts)

-- Apps
keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
keymap('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', opts)