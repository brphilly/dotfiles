setlocal norelativenumber
setlocal nonumber
setlocal signcolumn=yes:1

augroup VerticalHelp
	autocmd! * <buffer>
	autocmd BufWinEnter <buffer> wincmd L
augroup END
