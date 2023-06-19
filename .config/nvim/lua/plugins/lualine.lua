return {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup{
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename" },
                lualine_c = {
                    -- invoke `progress` here.
                    require("lsp-progress").progress,
                },
            }
        }
        vim.cmd([[
            augroup lualine_augroup
                autocmd!
                autocmd User LspProgressStatusUpdated lua require("lualine").refresh()
            augroup END
        ]])
    end
}