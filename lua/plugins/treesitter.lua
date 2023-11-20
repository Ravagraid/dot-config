return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		event = "VeryLazy",
		opts = {
			highlight = { enable = true, additional_vim_regex_highlighting = true },
			indent = { enable = true },
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"diff",
				"json",
				"json5",
				"jsonc",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"regex",
				"vimdoc",
				"vim",
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
			require("nvim-treesitter.install").compilers = { "zig" }
			require("nvim-treesitter.install").prefer_git = false
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
