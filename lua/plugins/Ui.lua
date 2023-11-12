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
			vim.o.laststatus = vim.g.lualine_laststatus
			return {
				options = {
					icons_enabled = true,
					theme = "everforest",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "filename", path = 1 } },
					lualine_c = { "diagnostics", "diff", "filesize" },
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
			function _lazygit_toggle()
				require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
			end
			return {
				direction = "float",
				open_mapping = [[<c-\>]],
				float_opts = { border = "curved" },
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
	{
		"echasnovski/mini.indentscope",
		event = "VeryLazy",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
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
	{ "MunifTanjim/nui.nvim", lazy = true },
}
