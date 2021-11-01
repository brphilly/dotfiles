if vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].loclist ~= 1 then
	vim.cmd("wincmd J")
end
vim.opt_local.colorcolumn = ""
