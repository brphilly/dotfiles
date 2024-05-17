vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	group = vim.api.nvim_create_augroup("UpdateBuf", { clear = true }),
	command = "silent! checktime",
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("MyTerminal", { clear = true }),
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 1000 })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("SpellFt", { clear = true }),
	pattern = { "text", "markdown", "conf" },
	callback = function()
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd("CursorMoved", {
	group = vim.api.nvim_create_augroup("AutoHlSearch", { clear = true }),
	callback = function()
		if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
			vim.api.nvim_input("<c-l>")
		end
	end,
})
