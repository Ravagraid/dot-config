return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	event = "VeryLazy",
	opts = {
		highlight = { enable = true, additional_vim_regex_highlighting = true },
		indent = { enable = true },
		ensure_installed = {
			"c",
			"lua",
			"luadoc",
			"vim",
			"vimdoc",
			"query",
			"regex",
			"bash",
			"markdown",
			"markdown_inline",
		},
		incremental_selection = {
			enable = true,
		},
		auto_install = true,
		autotag = {
			enable = true,
		},
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	},
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
			end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
