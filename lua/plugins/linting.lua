return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	optional = true,
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			markdown = { "markdownlint" },
		},
	},
	init = function()
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
