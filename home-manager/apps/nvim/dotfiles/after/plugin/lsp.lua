-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
})

-- Mason settings
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        -- ansible
        'ansiblels',
        -- bash
        'bashls',
        -- C#
        'omnisharp',
        -- docker
        'docker_compose_language_service',
        -- Java
        'jdtls',
        -- JSON
        'jsonls',
        -- latex
        'ltex',
        'texlab',
        -- lua
        'lua_ls',
        -- markdown
        -- 'markdownlint',
        -- perl
        'perlnavigator',
        -- python
        'pyright',
        -- Don't install pylint, install it in your venv, else it will throw false errors.
        -- ruby
        -- 'ruby_ls',
        -- SQL
        'sqlls',
        -- TypeScript
        'ts_ls',
        -- YAML
        'yamlls',
    },

})

-- Enable LSPs
vim.lsp.enable('dartls')

-- Settings for LSPs
vim.filetype.add {
    extension = {
        jinja = 'jinja',
        jinja2 = 'jinja',
        j2 = 'jinja',
    },
}

-- Settings for Null-ls
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.black,

        null_ls.builtins.diagnostics.pylint.with({
            prefer_local = "venv/bin",
        }),

        null_ls.builtins.formatting.yamlfmt,
    },
})

-- cmp setup
local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
        { name = 'path',     priority = 1250 },
        { name = 'omni',     priority = 1250 },
        { name = 'nvim_lsp', priority = 750 },
        { name = 'luasnip',  priority = 500 },
    }),
    mapping = cmp.mapping.preset.insert({
        -- Confirm completion
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),

        -- Trigger completion menu
        ['<A-Enter>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholders

        -- Scroll through completions
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    })
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', '<A-Enter>', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    end,
})
