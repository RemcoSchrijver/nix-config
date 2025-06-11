require("neotest").setup({
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            args = { "--log-level", "DEBUG" },
            runner = "pytest",
            python = ".venv/bin/python",
        })
    }
})

-- Neotest keymaps
local neotest = require('neotest')

vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand('%')) end, { desc = "Run current file" })
vim.keymap.set("n", "<leader>ta", function() neotest.run.run({ suite = true }) end, { desc = "Run all tests" })
vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = 'dap' }) end, { desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>tc", function() neotest.run.stop() end, { desc = "Cancel test" })
vim.keymap.set("n", "<leader>tn", function() neotest.run.attach() end, { desc = "Attach to nearest test" })
vim.keymap.set("n", "<leader>to", function() neotest.output.open() end, { desc = "Show test output" })
vim.keymap.set("n", "<leader>tp", function() neotest.output_panel.toggle() end, { desc = "Toggle output panel" })
vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle summary" })
