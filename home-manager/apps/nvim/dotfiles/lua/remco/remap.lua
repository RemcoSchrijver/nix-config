vim.g.mapleader = " "

-- Remapping Ex to <leader>pv and save when doing that.
vim.keymap.set("n", "<leader>pv", function ()
    vim.cmd('update')
    vim.cmd('Ex')
end)

-- Allows for compacting lines in V mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Keep yourself oriented when moving through pages
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Use <leader>p to paste over something without losing your buffer
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Use <leader>y to yank to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Use <leader>x to chmod something to be executable, use <leader>X to undo it
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>X", "<cmd>!chmod -x %<CR>", { silent = true })

-- Use <leader>d to delete to void
vim.keymap.set('n', '<leader>d', "\"_d")
vim.keymap.set('v', '<leader>d', "\"_d")

