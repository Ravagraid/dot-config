return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- c, C++
			lspconfig.clangd.setup({})

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
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({})
			require("mason-tool-installer").setup({
				ensure_installed = {
					"fixjson",
					"json-lsp",
					"lua-language-server",
					"marksman",
					"prettier",
					"proselint",
					"stylua",
					"vim-language-server",
					"yaml-language-server",
					"yamllint",
				},
			})
		end,
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
