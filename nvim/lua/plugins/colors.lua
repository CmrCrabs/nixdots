-- return {
--   {
--     "rebelot/kanagawa.nvim",
--     lazy = false,
--     name = "kanagawa",
--     priority = 1000,
--     config = function()
--       vim.opt.background = "dark"
--       vim.cmd.colorschem "kanagawa-dragon"
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
--     end,
--   },
--   {
--     "NvChad/nvim-colorizer.lua",
--     config = function ()
--       require 'colorizer'.setup()
--     end,
--   },
-- }



return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    name = "oxocarbon",
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorschem "oxocarbon"
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require 'colorizer'.setup()
    end,
  },
}
