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
      on_attach = function(client, bufnr)
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'lr', vim.lsp.buf.rename, bufopts)
      end 
    }
    require'lspconfig'.pyright.setup{}
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  end
}
