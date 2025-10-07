local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-live-grep-args.nvim',
        },
    },
    -- Theme
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'ThePrimeagen/harpoon',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },
    {
        'mbbill/undotree',
    },
    {
        'tpope/vim-fugitive',
    },
    {
        { 'L3MON4D3/LuaSnip' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/nvim-cmp' },
        -- Help with Vimtex completions
        { 'hrsh7th/cmp-omni' },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },
    {
    },
    {
        'lervag/vimtex',
        ft = { "latex" },
    },
    {
        'jhofscheier/ltex-utils.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-telescope/telescope.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        opts = {},
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    -- LSPs
    {
        -- General
        { 'mason-org/mason.nvim' },
        {
            'neovim/nvim-lspconfig',
            dependencies = {
                { 'mason-org/mason-lspconfig.nvim' },
            }

        },

        -- Todo clean this part up:
        -- https://lugh.ch/switching-to-neovim-native-lsp.html

        {
            'nvimtools/none-ls.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim'
            }
        },
        -- Scala
        {
            'scalameta/nvim-metals',
            ft = { "scala" },
            dependencies = {
                'nvim-lua/plenary.nvim'
            },
        },
        -- Java
        {
            'mfussenegger/nvim-jdtls',
            ft = { "java" },
            dependencies = {
                'hrsh7th/cmp-nvim-lsp'
            },
        },
    },

    -- Testing
    {
        {
            "nvim-neotest/neotest",
            dependencies = {
                "nvim-neotest/nvim-nio",
                "nvim-lua/plenary.nvim",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-treesitter/nvim-treesitter",
            },
        },
        {
            "nvim-neotest/neotest-python",
            ft = { "python" },
        },
        {
            "rcasia/neotest-java",
            ft = { "java" },
            dependencies = {
                "mfussenegger/nvim-jdtls",
            },
        }
    }
}

local opts = {
    lockfile = '~/nix-config/home-manager/apps/nvim/dotfiles/lazy-lock.json'
}

require("lazy").setup(plugins, opts)
