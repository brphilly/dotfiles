vim.diagnostic.config({
	signs = {
		numhl = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" },
		linehl = { "ErrorLine", "WarningLine", "InfoLine", "HintLine" },
	},
	virtual_text = false,
	float = { source = "always" },
	severity_sort = true,
})
