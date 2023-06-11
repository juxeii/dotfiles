return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function() 
    require'cmp'.setup {
      sources = {
        { name = 'nvim_lsp' }
      },
    }
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- The following example advertise capabilities to `clangd`.
    require'lspconfig'.clangd.setup {
      capabilities = capabilities,
      cmd = { 
          "clangd", 
          "--background-index",
          "-j=40",
          "--pch-storage=memory",
          "--clang-tidy"
      },
    }
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  end,
  keys = {
      { "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", desc = "list symbols"},
      { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "goto declaration"},
      { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "goto definition"},
      { "<leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover"},
  },
}
