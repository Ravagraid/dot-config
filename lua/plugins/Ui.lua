return {
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
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			open_mapping = [[<c-\>]],
		},
	},
}
