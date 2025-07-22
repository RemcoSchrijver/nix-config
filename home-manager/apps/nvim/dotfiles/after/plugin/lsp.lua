local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')

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
        'biome',
        -- YAML
        'yamlls',
    },
    handlers = {
        lsp.default_setup,
    },
})



lsp.setup_servers({ 'dartls', force = true })

-- Settings for LSPs
lspconfig.ltex.setup({
    settings = {
        additionalRules = {
            enablePickyRules = true,
        },
    },
})
lspconfig.biome.setup({})
lspconfig.perlnavigator.setup {
    cmd = { "perlnavigator" },
    settings = {
        perlnavigator = {
            perlPath = 'perl',
            enableWarnings = true,
            perltidyProfile = '',
            perlcriticProfile = '',
            perlcriticEnabled = true,
        }
    }
}

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
local cmp_action = require('lsp-zero').cmp_action()

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
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll through completions
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    })
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<A-Enter>', function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup()
