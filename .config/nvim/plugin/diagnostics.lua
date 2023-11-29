vim.diagnostic.config({
	underline = false,
	virtual_text = false,
	float = { source = "always" },
	severity_sort = true,
})
vim.fn.sign_define({
	{ name = "DiagnosticSignError", numhl = "DiagnosticSignError" },
	{ name = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" },
	{ name = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" },
	{ name = "DiagnosticSignHint", numhl = "DiagnosticSignHint" },
})
