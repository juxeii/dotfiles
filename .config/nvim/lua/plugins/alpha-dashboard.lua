return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {            
            " __        ________   ______   __    __        ________ ",
            "/  |      /        | /      \\ /  |  /  |      /        |",
            "$$ |      $$$$$$$$/ /$$$$$$  |$$ |  $$ |      $$$$$$$$/ ",
            "$$ |      $$ |__    $$ | _$$/ $$  \\/$$/       $$ |__    ",
            "$$ |      $$    |   $$ |/    | $$  $$<        $$    |   ",
            "$$ |      $$$$$/    $$ |$$$$ |  $$$$  \\       $$$$$/    ",
            "$$ |_____ $$ |_____ $$ \\__$$ | $$ /$$  |      $$ |      ",
            "$$       |$$       |$$    $$/ $$ |  $$ |      $$ |      ",
            "$$$$$$$$/ $$$$$$$$/  $$$$$$/  $$/   $$/       $$/   ",
        }
        dashboard.section.buttons.val = {
            dashboard.button("<leader>e", "  File explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("<leader>f", "󰍉  Find file", "<cmd>lua require('fzf-lua').files()<CR>"),
            dashboard.button("a", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("<leader>r", "  Recently used files", "<cmd>lua require('fzf-lua').oldfiles()<CR>"),
            dashboard.button("<leader>lg", "󱎸  Find text", "<cmd>lua require('fzf-lua').live_grep()<CR>"),
            dashboard.button("c", "  Configuration", "<cmd>NvimTreeOpen ~/.config/nvim<CR>"),
        }

        local function footer()
            return "Carthago delenda est."
        end

        dashboard.section.footer.val = footer()

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true
        alpha.setup(dashboard.opts)
    end,
}