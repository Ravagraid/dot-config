return {
	--File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = false,
		branch = "v3.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			popup_border_style = "rounded",
			filesystem = {
				hide_dotfiles = true,
				hide_gitignored = true,
				hijack_netrw_behavior = "open_current",
			},
			git_status = {
				symbols = {
					-- Change type
					added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "✖", -- this can only be used in the git_status source
					renamed = "󰁕", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "",
					unstaged = "󰄱",
					staged = "",
					conflict = "",
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					---@diagnostic disable-next-line: unused-local
					handler = function(file_path)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["<leader>"] = {
					a = { "ggVG", "Select All" },
					e = { "<cmd>Neotree toggle<cr>", "Filetree" },
					g = { "<cmd>lua _lazygit_toggle()<cr>", "Git" },
					i = { "<cmd>ToggleAlternate<cr>", "Alternate" },
					q = { "<cmd>q<cr>", "Quit" },
					w = { "<cmd>w<cr>", "Save" },
					x = { "<cmd>x<cr>", "Save and Quit" },
				},
				["g"] = { name = "+goto" },
				["gs"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = {
					name = "+file/find",
					f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
				},
				["<leader>gh"] = { name = "+hunks" },
				["<leader>s"] = { name = "+search" },
				["<leader>u"] = { name = "+ui" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}
