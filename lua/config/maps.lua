local opts = { noremap = true, silent = true }
-- Clear search highlights
vim.keymap.set("n", "<Leader><space>", ":noh<CR>", opts)

--Yanky
vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
