return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "left"
                    }
                },
            },
        }
        vim.keymap.set('n', 'gb', '<CMD>BufferLinePick<CR>')
        vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
        vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
        vim.keymap.set('n', '<S-n>', '<CMD>BufferLineMoveNext<CR>')
        vim.keymap.set('n', '<S-p>', '<CMD>BufferLineMovePrev<CR>')
    end,
}