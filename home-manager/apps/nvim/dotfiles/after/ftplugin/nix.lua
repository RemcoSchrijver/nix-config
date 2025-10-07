vim.keymap.set("n", "<leader>f", "<cmd>w<CR><cmd>!nixpkgs-fmt %<CR>", {
    silent = true,
    buffer = true,
})
