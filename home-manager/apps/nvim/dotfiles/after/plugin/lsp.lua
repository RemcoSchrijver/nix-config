local lsp = require('lsp-zero')

lsp.preset('recommended')

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
    -- python
    'jedi_language_server',
    'pyright',
    'pyre',
    -- ruby
    -- 'ruby_ls',
    -- SQL
    'sqlls',
    -- YAML
    'yamlls'
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp.setup_servers({'dartls', force = true})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- Confirm completion
        ['<Tab>'] = cmp.mapping.confirm({select = true}),

        -- Trigger completion menu
        ['<A-Enter>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholders
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll through completions
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    })
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set('n', '<A-Enter>', function() vim.lsp.buf.code_action() end, opts)
end)

lsp.setup()
