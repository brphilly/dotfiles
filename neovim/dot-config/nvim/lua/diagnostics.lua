vim.diagnostic.config({
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
vim.keymap.set("n", "gK", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
