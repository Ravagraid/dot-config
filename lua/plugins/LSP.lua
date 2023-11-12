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
				"lua-language-server",
				"stylua",
				"vim-language-server",
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
						},
					}))
				end,
			})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = false,
		config = function()
			require("lspsaga").setup({
				diagnostic = {
					border_follow = false,
				},
				symbol_in_winbar = {
					folder_level = 2,
					delay = 300,
				},
			})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
