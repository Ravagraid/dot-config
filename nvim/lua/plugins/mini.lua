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
			require("mini.basics").setup({
				options = { win_borders = "single" },
				mappings = {
					windows = true,
					move_with_alt = true,
				},
			})
			require("mini.pairs").setup({
				modes = { insert = true, command = false, terminal = false },
				skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
				skip_ts = { "string" },
				skip_unbalanced = true,
				markdown = true,
				mappings = {
					["*"] = { action = "closeopen", pair = "**", neigh_pattern = "[^\\].", register = { cr = false } },
				},
			})
			-- require("mini.surround").setup({
			-- 	mappings = {
			-- 		add = "gsa", -- Add surrounding in Normal and Visual modes
			-- 		delete = "gsd", -- Delete surrounding
			-- 		find = "gsf", -- Find surrounding (to the right)
			-- 		find_left = "gsF", -- Find surrounding (to the left)
			-- 		highlight = "gsh", -- Highlight surrounding
			-- 		replace = "gsr", -- Replace surrounding
			-- 		update_n_lines = "gsn", -- Update `n_lines`
			-- 	},
			-- })
			require("mini.ai").setup()
			require("mini.comment").setup()
			require("mini.move").setup()
			require("mini.splitjoin").setup()
		end,
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function() vim.b.miniindentscope_disable = true end,
			})
		end,
	},
}
