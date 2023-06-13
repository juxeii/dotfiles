return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require'tokyonight'.setup {
              style = "moon",
              terminal_colors = true,
        }
        vim.cmd[[colorscheme tokyonight]]
    end,
}