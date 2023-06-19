return {
    "nvim-lualine/lualine.nvim",
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    config = function()
        require('lualine').setup{
            sections = {
                lualine_c = {
                    'lsp_progress'
                }
            }
        }
    end
}