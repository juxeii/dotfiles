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
    cmp.setup({
        snippet = {
          expand = function(args)
            lua_snip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
              ['<Tab>'] = function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end,
              ['<S-Tab>'] = function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                else
                  fallback()
                end
              end,
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<Esc>'] = cmp.mapping.close(),
              ['<C-d>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-k>'] = cmp.mapping.select_prev_item(),
              ['<C-j>'] = cmp.mapping.select_next_item(),
        }),
        sources = {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        },
    })
end

return M