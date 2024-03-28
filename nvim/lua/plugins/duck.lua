return {
    'tamton-aquib/duck.nvim',
    config = function()
        vim.keymap.set(
            'n',
            '<leader>d',
            function()
                require("duck").hatch()
                require("duck").hatch()
                require("duck").hatch()
            end,
            {}
        )
        vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
        -- nnoremap <leader>dd :lua require("duck").hatch("ඞ")<CR>
    end
}
