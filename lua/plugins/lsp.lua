return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			})

			-- markdown
			lspconfig.marksman.setup({})

			--yaml
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemaStore = {
							enable = false,
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})

			--webdev
			lspconfig.html.setup({})
			lspconfig.cssls.setup({})
			lspconfig.jsonls.setup({
				settings = {
					json = {
						format = {
							enable = true,
						},
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.theme_check.setup({})
		end,
	},
	--Mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts = {
			PATH = "prepend",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"fixjson",
				"json-lsp",
				"lua-language-server",
				"marksman",
				"prettierd",
				"proselint",
				"stylua",
				"vim-language-server",
				"yaml-language-server",
				"yamllint",
			},
			auto_update = true,
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- optional
		},
		config = function()
			require("lspsaga").setup({
				diagnostic = {
					border_follow = false,
				},
				symbol_in_winbar = {
					show_file = false,
					delay = 0,
				},
				code_action = {
					show_server_name = true,
				},
			})
		end,
	},
}
