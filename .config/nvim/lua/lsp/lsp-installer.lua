local servers = {
    "clangd",
    "pyright",
    "lua_ls",
    "cmake"
}

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

lspconfig = require("lspconfig")

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }
    local require_ok, conf_opts = pcall(require, "lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end
    lspconfig[server].setup(opts)
end