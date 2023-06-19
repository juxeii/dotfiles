local M = {}

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

M.setup = function()
    local config = {
        virtual_text = false,
    }

    vim.diagnostic.config(config)
end

M.on_attach = function(client, bufnr)
    if client.name == "clangd" then
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>s", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
    end
    lsp_keymaps(bufnr)
end

M.capabilities = require('cmp_nvim_lsp').default_capabilities()

return M