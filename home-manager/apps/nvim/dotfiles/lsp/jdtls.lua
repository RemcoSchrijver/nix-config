vim.lsp.config("jdtls", {
    cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar')
    },

    root_dir = vim.fs.root(0, { 'pom.xml', '.git' }),

    settings = {
        java = {
            -- Custom eclipse.jdt.ls options go here
        },
    },
})
