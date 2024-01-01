return {
	--Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = function()
			local prose = require("nvim-prose")
			vim.o.laststatus = vim.g.lualine_laststatus
			return {
				options = {
					icons_enabled = true,
					theme = "everforest",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
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
				lualine_c = { "filename" },
				lualine_x = { "location" },
			}
		end,
	},

	--Terminal
	{
		"akinsho/toggleterm.nvim",
		opts = function()
			---@diagnostic disable-next-line: lowercase-global
			function _lazygit_toggle()
				require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
			end
			return {
				direction = "horizontal",
				open_mapping = [[<c-\>]],
				float_opts = { border = "curved" },

				-- toggle for lazygit
				vim.api.nvim_set_keymap(
					"n",
					"<leader>g",
					"<cmd>lua _lazygit_toggle()<CR>",
					{ noremap = true, silent = true }
				),
			}
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
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
					"neo-tree",
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
	{ "MunifTanjim/nui.nvim", lazy = true },
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
			},
		},
	},
}
