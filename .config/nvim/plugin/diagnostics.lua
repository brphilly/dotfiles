vim.diagnostic.config({
	signs = { numhl = { "DiagnosticSignError", "DiagnosticSignWarn", "DiagnosticSignInfo", "DiagnosticSignHint" } },
	virtual_text = false,
	float = { source = "always" },
	severity_sort = true,
})
