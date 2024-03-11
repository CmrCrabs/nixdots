vim.g.mapleader = " "

vim.keymap.set('i', 'jj', '<ESC>', {silent = true})
vim.keymap.set('n', '<leader>l', '<cmd>ls<CR>:b<space>')
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
vim.keymap.set('', 'H', '^', {remap = false})
vim.keymap.set('', 'L', '$', {remap = false})
vim.keymap.set('n', 'n', 'nzz', {remap = false})
vim.keymap.set('n', 'N', 'Nzz', {remap = false})
--vim.keymap.set('n', '<S-CR>', 'O<Esc>')
--  vim.keymap.set('n', '<enter>', 'o<Esc>')

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- reselect visual block after indent
vim.keymap.set("v", "<", "<gv", {remap = false})
vim.keymap.set("v", ">", ">gv", {remap = false})

vim.keymap.set("x", "s", ":s/\\%V", {remap = false})
--move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--stay where you where with J
vim.keymap.set("n", "J", "mzJ`z")

--half-page jumps centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- paste without yanking
vim.keymap.set("x", "<leader>p", '"_dP')

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- ctrl-c in block mode
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>ft", ":Neotree toggle filesystem reveal left<CR>")
