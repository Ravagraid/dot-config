return {
	{
		"williamboman/mason.nvim",
		priority = 100,
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

			-- shell
			require("lspconfig").nushell.setup({})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			local keymap = vim.keymap
			require("lspsaga").setup({
				diagnostic = {
					border_follow = false,
				},
				symbol_in_winbar = {
					show_file = false,
					delay = 0,
				},
				ui = {
					border = "rounded",
				},
			})
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>")
			keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>")

			local builtin = require("telescope.builtin")

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
					vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", "<cmd>Lspsaga code_action<cr>", opts)
					vim.keymap.set("n", "gr", builtin.lsp_references, opts)
				end,
			})

			vim.keymap.set("n", "<space>k", "<cmd>Lspsaga hover_doc<cr>", { silent = true })

			-- error lens
			vim.fn.sign_define({
				{
					name = "DiagnosticSignError",
					text = "",
					texthl = "DiagnosticSignError",
					linehl = "ErrorLine",
				},
				{
					name = "DiagnosticSignWarn",
					text = "",
					texthl = "DiagnosticSignWarn",
					linehl = "WarningLine",
				},
				{
					name = "DiagnosticSignInfo",
					text = "",
					texthl = "DiagnosticSignInfo",
					linehl = "InfoLine",
				},
				{
					name = "DiagnosticSignHint",
					text = "",
					texthl = "DiagnosticSignHint",
					linehl = "HintLine",
				},
			})
		end,
	},
}
