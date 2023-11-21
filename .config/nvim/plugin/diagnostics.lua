vim.diagnostic.config({
	virtual_text = { source = "always" },
	float = { source = "always", border = "single" },
	update_in_insert = false,
	severity_sort = true,
})
vim.fn.sign_define({
	{ name = "DiagnosticSignError", numhl = "DiagnosticSignError" },
	{ name = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" },
	{ name = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" },
	{ name = "DiagnosticSignHint", numhl = "DiagnosticSignHint" },
})
