require('Comment').setup()

api = require('Comment.api')

vim.keymap.set("n", "<C-_>", function() api.toggle.linewise.current() end)
vim.keymap.set('v', '<C-_>', function()
    vim.api.nvim_feedkeys('esc', 'nx', false)
    api.toggle.linewise(vim.fn.visualmode())
end)
