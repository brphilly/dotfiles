vim.api.nvim_create_augroup("UpdateBuf", {})
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained"}, {group = "UpdateBuf", command = "silent! checktime"})

vim.api.nvim_create_augroup("MyTerminal", {})
vim.api.nvim_create_autocmd("TermOpen", {group = "MyTerminal", callback = function()
	vim.opt_local.wrap = true
	vim.opt_local.number = false
	vim.opt_local.relativenumber = false
end})

vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {group = "HighlightYank", callback = function()
	vim.highlight.on_yank({higroup = "Visual", timeout = 1000})
end})

vim.api.nvim_create_augroup("StartSearchHL", {})
vim.api.nvim_create_autocmd("CmdLineLeave", {group = "StartSearchHL", pattern = {"/", "?"}, callback = function()
	require("bp.keymap-funcs").start_hl()
end})

vim.api.nvim_create_augroup("DirectorySave", {})
vim.api.nvim_create_autocmd({"BufWritePre", "FileWritePre"}, {group = "DirectorySave", command = "silent! call mkdir(expand('<afile>:p:h'), 'p')"})

vim.api.nvim_create_augroup("SpellFT", {})
vim.api.nvim_create_autocmd("FileType", {group = "SpellFT", pattern = {"text", "markdown", "conf"}, callback = function()
	vim.opt_local.spell = true
end})
