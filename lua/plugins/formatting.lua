return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		dependencies = { "mason.nvim" },
		event = { "BufWritePre", "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				markdown = { "prettier" },
				json = { "fixjson" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
}
