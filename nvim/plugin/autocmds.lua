vim.cmd [[
	augroup UpdateBuf
	autocmd!
	autocmd BufEnter,FocusGained * checktime
	augroup END
]]

vim.cmd [[
	augroup Terminal
	autocmd!
	autocmd TermOpen * setlocal wrap
	autocmd TermOpen * setlocal nonumber
	autocmd TermOpen * setlocal norelativenumber
	autocmd TermOpen * startinsert
	autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
	augroup END
]]

vim.cmd [[
	augroup HighlightYank
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "Visual", timeout = 1000}
	augroup END
]]

vim.cmd [[
	augroup StartSearchHL
	autocmd!
	autocmd CmdLineLeave [/\?] lua require("bp.keymap-funcs").start_hl()
	augroup END
]]

vim.cmd [[
	augroup ProjRoot
	autocmd!
	autocmd BufAdd * lua require'bp.utils'.proj_root(true)
	augroup END
]]

vim.cmd [[
	augroup DirectorySave
	autocmd!
	autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
	augroup END
]]
