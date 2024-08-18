return {
	{
		"skwee357/nvim-prose",
		lazy = true,
		config = function()
			require("nvim-prose").setup({
				wpm = 200.0,
				filetypes = { "markdown", "asciidoc", "txt" },
				placeholders = {
					words = "words",
					minutes = "min",
				},
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown", "md" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
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
