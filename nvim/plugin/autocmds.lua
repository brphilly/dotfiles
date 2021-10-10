vim.cmd([[
	augroup UpdateBuf
	autocmd!
	autocmd BufEnter,FocusGained * silent! checktime
	augroup END
]])

vim.cmd([[
	augroup Terminal
	autocmd!
	autocmd TermOpen * setlocal wrap
	autocmd TermOpen * setlocal nonumber
	autocmd TermOpen * setlocal norelativenumber
	autocmd TermOpen * startinsert
	autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
	augroup END
]])

vim.cmd([[
	augroup HighlightYank
	autocmd!
	autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup = "Visual", timeout = 1000}
	augroup END
]])

vim.cmd([[
	augroup StartSearchHL
	autocmd!
	autocmd CmdLineLeave [/\?] lua require("bp.keymap-funcs").start_hl()
	augroup END
]])

vim.cmd([[
	augroup DirectorySave
	autocmd!
	autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
	augroup END
]])

vim.cmd([[
	augroup SpellFT
	autocmd!
	autocmd FileType text,markdown,conf setlocal spell
	augroup END
]])

vim.cmd([[
	augroup CommandWin
	autocmd!
	autocmd CmdwinEnter * startinsert
	autocmd CmdwinEnter * nnoremap <buffer> <c-[> <cmd>quit<cr>
	autocmd CmdwinEnter : nnoremap <buffer> <cr> <cr>q:
	autocmd CmdwinEnter : inoremap <buffer> <cr> <cr>q:
	augroup END
]])
