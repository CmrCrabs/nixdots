
function TweakColors(color)
	color = color or "nord"--"rose-pine"
	vim.cmd.colorscheme(color)

    --vim.api.nvim_set_hl(0, "Normal", { bg  = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg  = "none" })
end

require("notify").setup({
    background_colour = "#000000",
})

--TweakColors("catppuccin-frappe")

require("catppuccin").setup({
    flavour = "frappe",
    transparent_background = true,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
   custom_highlights = function(colors)
     return {
       --Comment = { fg = "#89AEB1"},
       LineNr = { fg = colors.overlay0 },
       WarningMsg = { style = { "italic" } },
       ErrorMsg = { style = { "italic" } }
     }
   end,
})
vim.cmd.colorscheme "catppuccin"
