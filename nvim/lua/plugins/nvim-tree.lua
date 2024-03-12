return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    vim.keymap.set('n', '<leader>e', ':NvimTreeOpen<CR>', {})
    vim.keymap.set('n', '<leader>ce', ':NvimTreeClose<CR>', {})
  end,
}
