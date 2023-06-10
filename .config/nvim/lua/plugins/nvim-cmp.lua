local M = {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
}

M.config = function()
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
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
            }),
        sources = {
            { name = 'luasnip' }
          },
    })
end

return M