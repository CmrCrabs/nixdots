return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- LSPs
          "lua_ls",
          "tsserver",
          "rust_analyzer",
          "omnisharp",
        }
      })
    end
  },
}
