require('nvim-treesitter').setup()

local parsers = { "hyprlang", "c", "lua", "vim", "vimdoc", "query", "dart", "python", "javascript", "java", "c_sharp",
    "yaml", "dockerfile", "json", "make", "scala" }

require('nvim-treesitter').install(parsers)

-- Hyperland config syntax highlighting
vim.filetype.add({
    pattern = { ["hyprland.conf"] = "hyprlang" },
})

-- Default to static completion for SQL
vim.g.omni_sql_default_compl_type = 'syntax'
