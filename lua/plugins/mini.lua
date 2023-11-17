return {
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				symbol = "│",
				options = { try_as_border = true },
			})
			require("mini.pairs").setup()
		end,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
}
