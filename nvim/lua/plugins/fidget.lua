return {
    "j-hui/fidget.nvim",
    opts = {
        -- options
        notification = {
            filter = vim.log.levels.INFO,
        },
        progress = {
            suppress_on_insert = true,
            display = {
                render_limit = 8,
                progress_icon = { pattern = "clock", period = 1 },
            },
        }
    },
}
