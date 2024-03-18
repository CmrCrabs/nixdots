return {
  {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities
    })
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities
    })
    lspconfig.omnisharp.setup({
      cmd = { "/home/zyn/.local/share/nvim/mason/bin/omnisharp" },
      capabilities = capabilities,
    })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  end,
  },
  {
    "LnL7/vim-nix",
  }
}
