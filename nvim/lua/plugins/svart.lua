return {
    url = "https://gitlab.com/madyanov/svart.nvim",
    as = "svart.nvim",
    config = function()
        vim.keymap.set({ "n", "x", "o" }, "s", "<Cmd>Svart<CR>")        -- begin exact search
        vim.keymap.set({ "n", "x", "o" }, "S", "<Cmd>SvartRegex<CR>")   -- begin regex search
        vim.keymap.set({ "n", "x", "o" }, "gs", "<Cmd>SvartRepeat<CR>") -- repeat with last accepted query
    end,
}
