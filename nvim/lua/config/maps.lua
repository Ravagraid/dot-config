local key = vim.keymap

key.set("n", "<c-a>", "ggVG", { desc = "Select all" })
key.set("n", "<Leader><space>", ":nohl<CR>", { desc = "Clear search highlights" })
key.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
key.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

key.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy UI" })
key.set("n", "<c-g>", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Lazygit" })
