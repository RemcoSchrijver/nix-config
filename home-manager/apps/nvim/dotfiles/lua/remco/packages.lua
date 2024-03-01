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
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = {
			'nvim-lua/plenary.nvim'
		},
	},
	{
        -- Theme
        "rose-pine/neovim",
        name = "rose-pine",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
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
        -- tmux plugins 
        'christoomey/vim-tmux-navigator',
          cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
          },
          keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
          },
    },
	{
		'tpope/vim-fugitive',
	},
    {
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig'},
        {'L3MON4D3/LuaSnip'},        
        {'hrsh7th/cmp-path'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        -- Help with Vimtex completions
        {'hrsh7th/cmp-omni'},

        {
            'huggingface/llm.nvim',
        },
        
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
        'scalameta/nvim-metals',
        dependencies = {
			'nvim-lua/plenary.nvim'
        }
    },
    {
        'lervag/vimtex'
    },
}

local opts = {}

require("lazy").setup(plugins,opts)
