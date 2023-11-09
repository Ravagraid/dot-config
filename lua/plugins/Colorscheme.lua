return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,

		config = function()
			vim.cmd("colorscheme everforest")
		end,
	},
}

--vim.g.everforest_diagnostic_line_highlight = 1

--vim.fn.sign_define({
--	{
--		name = "DiagnosticSignError",
--		text = "",
--		texthl = "DiagnosticSignError",
--		linehl = "ErrorLine",
--	},
--	{
--		name = "DiagnosticSignWarn",
--		text = "",
--		texthl = "DiagnosticSignWarn",
--		linehl = "WarningLine",
--	},
--	{
--		name = "DiagnosticSignInfo",
---		text = "",
--		texthl = "DiagnosticSignInfo",
--		linehl = "InfoLine",
--	},
--	{
--		name = "DiagnosticSignHint",
--		text = "",
--		texthl = "DiagnosticSignHint",
--		linehl = "HintLine",
--	},
--})
