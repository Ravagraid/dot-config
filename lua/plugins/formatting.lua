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
				json = { "prettierd" },
				yaml = { "prettierd" },
				html = { "prettierd" },
				scss = { "prettierd" },
				css = { "prettierd" },
				markdown = { "prettierd" },
			},
			format_on_save = { timeout_ms = 500, async = false, lsp_fallback = true },
		},
	},
}
