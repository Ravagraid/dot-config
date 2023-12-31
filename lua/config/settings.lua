local opt = vim.opt

opt.spelllang = "en_gb"
opt.spell = true

opt.number = true
opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true -- break on words
vim.opt.breakindent = true -- align wrapped line with previous indent level
vim.opt.breakindentopt = "list:-1"
vim.opt.formatlistpat = "^\\s*[-~>]\\+\\s\\((.)\\s\\)\\?"

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.hlsearch = true
opt.incsearch = true

opt.mouse = "a"
opt.clipboard:append("unnamedplus")

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = "yes"
opt.list = true

opt.cursorline = true
opt.termguicolors = true
opt.showmode = false

opt.updatetime = 300
opt.timeoutlen = 500

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
