return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		dependencies = { "mason.nvim" },
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "biome" },
				markdown = { "mdformat" },
			},
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
		},
	},
}
