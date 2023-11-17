return {
	{
		"folke/which-key.nvim",
			event = "VeryLazy",
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
				},

				["g"] = {
					name = "+goto",
					d = { "<cmd>Lspsaga goto_definition<cr>", "Goto Defintion" },
				},

				["gs"] = { name = "+surround" },

				["]"] = {
					name = "+next",
					d = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Diagnostic" },
					p = {
						function()
							if require("trouble").is_open() then
								require("trouble").next({ skip_groups = true, jump = true })
							else
								local ok, err = pcall(vim.cmd.cnext)
								if not ok then
									vim.notify(err, vim.log.levels.ERROR)
								end
							end
						end,
						"Next trouble/quickfix item",
					},
				},

				["["] = {
					name = "+prev",
					d = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Diagnostic" },
					p = {
						function()
							if require("trouble").is_open() then
								require("trouble").previous({ skip_groups = true, jump = true })
							else
								local ok, err = pcall(vim.cmd.cprev)
								if not ok then
									vim.notify(err, vim.log.levels.ERROR)
								end
							end
						end,
						"Previous trouble/quickfix item",
					},
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
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				"Next trouble/quickfix item",

				["<leader>gh"] = { name = "+hunks" },

				["<leader>s"] = { name = "+search" },

				["<leader>u"] = { name = "+ui" },

				["<leader>w"] = { name = "+windows" },

				["<leader>x"] = {
					name = "+diagnostics/quickfix",
					x = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
					X = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
					L = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
					Q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register(opts.defaults)
		end,
	},
}
