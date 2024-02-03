return {
	{
		"skwee357/nvim-prose",
		config = function()
			require("nvim-prose").setup({
				wpm = 200.0,
				filetypes = { "markdown", "asciidoc", "norg", "txt" },
				placeholders = {
					words = "words",
					minutes = "min",
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	{
		"jakewvincent/mkdnflow.nvim",
		config = function()
			require("mkdnflow").setup({
				modules = {
					yaml = true,
					cmp = true,
				},
				perspective = {
					priority = "root",
					root_tell = "index.md",
				},
				wrap = true,
				tables = {
					auto_extend_rows = true,
					auto_extend_cols = true,
				},
				mappings = {
					MkdnEnter = { { "i", "n", "v" }, "<CR>" },
				},
			})
		end,
	},
}
