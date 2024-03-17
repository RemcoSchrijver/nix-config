
vim.api.nvim_create_autocmd("FileType", {
    pattern = {"nix"},
    callback = function ()
        vim.schedule(function()
            vim.keymap.set("n", "<leader>f", "<cmd>w<CR><cmd>!nixpkgs-fmt %<CR>", { silent = true })
        end)
    end,
})
