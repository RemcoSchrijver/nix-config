require 'jdtls'.start_or_attach {
    cmd = {
        vim.fn.expand '$HOME/.local/share/nvim/mason/bin/jdtls',
        ('--jvm-arg=-javaagent:%s'):format(vim.fn.expand '$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar')
    },
    capabilities = require 'cmp_nvim_lsp'.default_capabilities()
}
