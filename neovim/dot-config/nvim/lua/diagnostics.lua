vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "●",
		},
	},
	float = { source = true },
	severity_sort = true,
})
