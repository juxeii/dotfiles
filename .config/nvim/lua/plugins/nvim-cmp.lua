local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
    },
}

M.config = function()
    local cmp = require("cmp")
    local lua_snip = require("luasnip")
    require("luasnip/loaders/from_vscode").lazy_load()

    local check_backspace = function()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
    end

    local kind_icons = {
        Text = "󰊄",
        Method = "m",
        Function = "󰊕",
        Constructor = "",
        Field = "",
        Variable = "󰫧",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "v",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }

    cmp.setup({
        snippet = {
            expand = function(args)
                lua_snip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Esc>"] = cmp.mapping.close(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
        }),
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[NVIM_LUA]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                })[entry.source.name]
                return vim_item
            end,
        },
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = cmp.config.window.bordered(),
        },
        experimental = {
            ghost_text = false,
            native_menu = false,
        },
    })
end

return M
