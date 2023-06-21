local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap space as leader key
keymap("n", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
--keymap('n', '<C-h>', '<C-w>h', opts)
--keymap('n', '<C-j>', '<C-w>j', opts)
--keymap('n', '<C-k>', '<C-w>k', opts)
--keymap('n', '<C-l>', '<C-w>l', opts)
keymap("n", "<C-h>", "<cmd> TmuxNavigationLeft<CR>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigationRight<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigationDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigationUp<CR>", opts)

-- Follow tags
keymap("n", "t", "<C-]>", opts)

-- Apps

-- nvim-tree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "<leader>c", "<cmd>Bwipeout<CR>", opts)
-- fzf-lua
keymap("n", "<leader>f", '<cmd>lua require("plugins/fzf-lua").custom_files()<CR>', opts)

keymap("n", "<leader>b", '<cmd>lua require("fzf-lua").buffers()<CR>', opts)
keymap("n", "<leader>r", '<cmd>lua require("fzf-lua").oldfiles()<CR>', opts)
keymap("n", "<leader>lg", '<cmd>lua require("fzf-lua").live_grep()<CR>', opts)
-- spectre
keymap("n", "<leader>S", '<cmd>lua require("spectre").open()<CR>', opts)
-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", opts)

