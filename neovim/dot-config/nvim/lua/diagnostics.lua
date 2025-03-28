vim.diagnostic.config({
	virtual_lines = { current_line = true },
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
vim.keymap.set("n", "gl", function()
	if vim.diagnostic.config().virtual_lines then
		vim.diagnostic.config({ virtual_lines = false })
	else
		vim.diagnostic.config({ virtual_lines = { current_line = true } })
	end
end, { desc = "Toggle diagnostic virtual_lines" })
