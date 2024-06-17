return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
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
			})
		end,
	},
}
