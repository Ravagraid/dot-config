require("toggleterm").setup({
	direction = "float",
	open_mapping = [[<c-\>]],
})

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle()
	require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle()
end

vim.g.bookmark_sign = "♥️"
vim.g.bookmark_no_default_key_mappings = true
require("telescope").load_extension("vim_bookmarks")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
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
		lualine_b = { { "filename", path = 1 } },
		lualine_c = { "diagnostics", "diff", "filesize" },
		lualine_x = { "encoding", "fileformat" },
		lualine_y = { "location", "progress" },
		lualine_z = { "filetype" },
	},
	inactive_sections = {
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
})
