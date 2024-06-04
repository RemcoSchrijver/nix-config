
-- Turn on textwrap for text based file types.
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*.tex", "*.md", "*.markdown", "*.html", "*.txt"},
    group = group,
    command = 'setlocal wrap | setlocal linebreak'
})
