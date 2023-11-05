local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	print("err")
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

require("lazy").setup({
	"sainnhe/everforest",
	"nvim-lualine/lualine.nvim",
	{ "folke/which-key.nvim", event = "VeryLazy" },

	"MattesGroeger/vim-bookmarks",
	"tom-anders/telescope-vim-bookmarks.nvim",

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	"rmagatti/alternate-toggler",
	"windwp/nvim-autopairs",
	"mg979/vim-visual-multi",
	"gcmt/wildfire.vim",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	"nvim-telescope/telescope.nvim",

	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"onsails/lspkind-nvim",
	{
		"glepnir/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"mfussenegger/nvim-lint",

	"nvim-treesitter/nvim-treesitter",
	"stevearc/conform.nvim",
	"folke/todo-comments.nvim",
	"numToStr/Comment.nvim",
	"akinsho/toggleterm.nvim",

	"f-person/git-blame.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},

	"fedepujol/move.nvim",
	"gbprod/yanky.nvim",
	"mechatroner/rainbow_csv",

	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
		},
	},
})

require("Coding")
require("Colorscheme")
require("Editor")
require("Formatting")
require("LSP")
require("Maps")
require("Treesitter")
require("Settings")
require("UI")
