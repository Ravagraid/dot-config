return {
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- programming
					c = { "clang-format" },
					lua = { "stylua" },

					-- webdev
					html = { "prettier" },
					scss = { "prettier" },
					css = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },

					--note taking
					markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },

					-- LaTeX
					tex = { "latexindent" },
				},
				format_on_save = { timeout_ms = 500, async = false, lsp_fallback = true },
			})
		end,
	},
}
