return {
	--Statusline
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local prose = require("nvim-prose")
			require("lualine").setup({
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "filename", path = 1 },
						{ "filesize" },
						{ prose.word_count, cond = prose.is_available },
						{ prose.reading_time, cond = prose.is_available },
					},
					lualine_c = { "diagnostics", "diff" },
					lualine_x = { "encoding", "fileformat" },
					lualine_y = { "location", "progress" },
					lualine_z = { "filetype" },
				},
			})
		end,
	},

	--Terminal
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				direction = "float",
				shell = "nu",
				float_opts = {
					border = "curved",
				},
			})

			-- lazygit toggle
			vim.api.nvim_set_keymap("n", "<c-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
			function _lazygit_toggle()
				require("toggleterm.terminal").Terminal
					:new({ cmd = "lazygit", hidden = true, direction = "float" })
					:toggle()
			end
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
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
			},
		},
		main = "ibl",
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = false,
			},
			messages = {
				enabled = false,
				view = "notify",
				view_error = "notify",
				view_warn = "notify",
				view_history = "messages",
				view_search = "virtualtext",
			},
		},
	},
	{
		"mrjones2014/legendary.nvim",
		dependencies = {
			"stevearc/dressing.nvim",
		},
		priority = 10000,
		lazy = false,
		init = function() require("legendary").setup({ extensions = { lazy_nvim = true } }) end,
	},
}
