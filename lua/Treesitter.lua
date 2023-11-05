require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "markdown", "markdown_inline" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = {},
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = false,
	},
})