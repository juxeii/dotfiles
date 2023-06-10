return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup {
        }
        vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
    end,
}