-- general
local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '
vim.opt.number = true
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- colorscheme
vim.cmd[[colorscheme tokyonight]]
-- fzf-lua
vim.keymap.set("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
-- neo-tree
--vim.keymap.set("n", "<leader>e", "<cmd>Neotree left<CR>")
--vim.keymap.set("n", "<leader>b", "<cmd>Neotree buffers<CR>")
-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
