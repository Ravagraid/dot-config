vim.g.mapleader = " "

local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.register({
	["<leader>"] = {
		--Misc
		a = { "ggVG", "Select All" },
		e = { "<cmd>Neotree toggle<cr>", "Filetree" },
		i = { "<cmd>ToggleAlternate<cr>", "Alternate" },
		q = { "<cmd>q<cr>", "Quit" },
		w = { "<cmd>w<cr>", "Save" },
		x = { "<cmd>x<cr>", "Save and Quit" },
		g = { "<cmd>lua _lazygit_toggle()<cr>", "GitUI" },
		f = { builtin.find_files, "Find File" },
		F = { builtin.live_grep, "Find Text" },

		--Lsp
		l = {
			name = "LSP",
			a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
			g = { "<cmd>Lspsaga goto_definition<cr>", "Goto Defintion" },
			h = { "<cmd>Lspsaga hover_doc<CR>", "Hover Diagnostics" },
			r = { "<cmd>Lspsaga rename<cr>", "Rename" },
			j = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
			k = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Prev Diagnostic" },
			o = { "<cmd>Lspsaga outline<cr>", "Outline" },
		},
	},

	-- Vim-Bookmarks
	m = {
		name = "Bookmarks",
		a = { "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>", "List All Marks" },
		c = { "<cmd>BookmarkClear<cr>", "Clear Bookmark" },
		C = { "<cmd>BookmarkClearAll<cr>", "Clear Bookmarks" },
		f = { "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>", "Current File Marks" },
		i = { "<cmd>BookmarkAnnotate<cr>", "Annotate Bookmark" },
		m = { "<cmd>BookmarkToggle<cr>", "Toggle Bookmark" },
		n = { "<cmd>BookmarkNext<cr>", "Next Bookmark" },
		p = { "<cmd>BookmarkPrev<cr>", "Prev Bookmark" },
	},

	p = { "<Plug>(YankyPutAfter)", "Put After" },
	P = { "<Plug>(YankyPutBefore)", "Put Before" },
})

vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", opts)
vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
vim.keymap.set("n", "<A-h>", ":MoveHChar(-1)<CR>", opts)
vim.keymap.set("n", "<A-l>", ":MoveHChar(1)<CR>", opts)
vim.keymap.set("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
vim.keymap.set("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
vim.keymap.set("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)
