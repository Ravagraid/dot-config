return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		dependencies = { "mason.nvim" },
		event = { "BufWritePre", "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				c = { "clang-format" },
				lua = { "stylua" },

				html = { "prettier" },
				scss = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			format_on_save = { timeout_ms = 500, async = false, lsp_fallback = true },
		},
	},
}
