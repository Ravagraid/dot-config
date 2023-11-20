return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
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
				"prettier",
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
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_config = {
				capabilities = capabilities,
				group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
			}

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup(lsp_config)
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
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
					}))
				end,
				require("lspconfig").marksman.setup(vim.tbl_extend("force", lsp_config, {})),
				require("lspconfig").jsonls.setup(vim.tbl_extend("force", lsp_config, {
					settings = {
						json = {
							format = {
								enable = true,
							},
							schemas = require("schemastore").json.schemas(),
							validate = { enable = true },
						},
					},
				})),
				require("lspconfig").yamlls.setup(vim.tbl_extend("force", lsp_config, {
					settings = {
						yaml = {
							schemaStore = {
								enable = false,
								url = "",
							},
							schemas = require("schemastore").yaml.schemas(),
						},
					},
				})),
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
					folder_level = 1,
					delay = 0,
				},
			})
		end,
	},
	{ "folke/neodev.nvim" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "mason.nvim" },
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				--markdown
				nls.builtins.diagnostics.proselint,
				nls.builtins.code_actions.proselint,
				nls.builtins.formatting.prettier,

				--lua
				nls.builtins.formatting.stylua,

				--json/yaml
				nls.builtins.formatting.fixjson,
				nls.builtins.diagnostics.jsonlint,
				nls.builtins.diagnostics.yamllint,
			})
		end,
	},
}
