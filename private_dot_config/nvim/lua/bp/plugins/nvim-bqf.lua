require("bqf").setup({
	func_map = {
		tabc = "<leader>=",
		split = "<leader>-",
		vsplit = [[<leader>\]],
	},
})

local c = require("nord.colours")
vim.api.nvim_create_augroup("bqf-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "bqf-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "BqfPreviewFloat", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "BqfPreviewBorder", {link = "FloatBorder"})
	vim.api.nvim_set_hl(0, "BqfPreviewRange", {link = "Visual"})
	vim.api.nvim_set_hl(0, "BqfSign", {fg = c.attention})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "bqf-hl", pattern = vim.g.colors_name})
