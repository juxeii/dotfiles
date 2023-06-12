local map = vim.api.nvim_set_keymap

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

map('n', '<Space>', '', {})
vim.g.mapleader = ' '
vim.opt.number = true

-- window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true