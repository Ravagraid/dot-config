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
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup()
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- {
	-- 	"jakewvincent/mkdnflow.nvim",
	-- 	config = function()
	-- 		require("mkdnflow").setup({
	-- 			modules = {
	-- 				yaml = true,
	-- 				cmp = true,
	-- 			},
	-- 			perspective = {
	-- 				priority = "root",
	-- 				root_tell = "index.md",
	-- 			},
	-- 			wrap = true,
	-- 			tables = {
	-- 				auto_extend_rows = true,
	-- 				auto_extend_cols = true,
	-- 			},
	-- 			mappings = {
	-- 				MkdnEnter = { { "i", "n", "v" }, "<CR>" },
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		-- TODO: Implement this plugin.
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
