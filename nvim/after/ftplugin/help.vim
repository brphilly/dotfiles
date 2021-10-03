setlocal norelativenumber
setlocal nonumber
setlocal signcolumn=yes:1
setlocal nolist
setlocal nospell
setlocal nobuflisted

augroup VerticalHelp
	autocmd! * <buffer>
	autocmd BufWinEnter <buffer> wincmd L
augroup END
