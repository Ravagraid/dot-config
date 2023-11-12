return {
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

				["g"] = {
					name = "+goto",
					g = { "<cmd>Lspsaga goto_definition<cr>", "Goto Defintion" },
				},

				["gs"] = { name = "+surround" },

				["]"] = {
					name = "+next",
					d = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic" },
				},

				["["] = {
					name = "+prev",
					d = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic" },
				},

				["<leader><tab>"] = { name = "+tabs" },

				["<leader>b"] = { name = "+buffer" },

				["<leader>c"] = {
					name = "+code",
					a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
					h = { "<cmd>Lspsaga hover_doc<CR>", "Hover Diagnostics" },
					r = { "<cmd>Lspsaga rename<cr>", "Rename" },
					o = { "<cmd>Lspsaga outline<cr>", "Outline" },
				},

				["<leader>f"] = {
					name = "+file/find",
					f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
					g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Find text" },
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
}
