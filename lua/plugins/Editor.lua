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
				filtered_items = {
					hide_dotfiles = true,
					hide_gitignored = true,
					hide_hidden = false,
				},
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
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					file_ignore_patterns = { "node_modules", "yarn.lock" },
					dynamic_preview_title = true,
					path_display = { "smart" },
					mappings = {
						i = {
							["<esc>"] = actions.close,
						},
					},
				},
				layout_config = {
					horizontal = {
						preview_cutoff = 100,
						preview_width = 0.6,
					},
				},
			}
		end,
	},
}
