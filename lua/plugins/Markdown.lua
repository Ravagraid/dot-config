return {
	{
		"skwee357/nvim-prose",
		config = function()
			require("nvim-prose").setup({
				wpm = 200.0,
				filetypes = { "markdown", "asciidoc" },
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
}
