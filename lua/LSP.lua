local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp_config = {
	capabilities = capabilities,
	group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
}

require("mason").setup({
	PATH = "prepend",
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"stylua",
		"vim-language-server",
	},
	auto_update = true,
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup(lsp_config)
	end,
	lua_ls = function()
		require("lspconfig").lua_ls.setup(vim.tbl_extend("force", lsp_config, {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		}))
	end,
})

require("lspkind").init({
	mode = "symbol_text",
	preset = "codicons",
	symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	},
})

require("lspsaga").setup({
	symbol_in_winbar = {
		folder_level = 0,
	},
})
