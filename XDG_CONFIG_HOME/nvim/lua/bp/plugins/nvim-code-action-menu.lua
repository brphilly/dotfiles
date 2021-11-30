local c = require("nord.colours")
vim.cmd(string.format([[
	augroup nvim-code-action-menu-hl
	autocmd!
	autocmd ColorScheme nord highlight! link CodeActionMenuMenuDisabled NonText
	autocmd ColorScheme nord highlight! link CodeActionMenuMenuSelection Visual
	autocmd ColorScheme nord highlight CodeActionMenuMenuIndex guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsPreferred guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsDisabled guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsAddedLinesCount guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsDeletedLinesCount guifg=%s
	autocmd ColorScheme nord highlight! link CodeActionMenuDetailsAddedSquares CodeActionMenuDetailsAddedLinesCount
	autocmd ColorScheme nord highlight! link CodeActionMenuDetailsDeletedSquares CodeActionMenuDetailsDeletedLinesCount
	autocmd ColorScheme nord highlight! link CodeActionMenuDetailsAddedLine CodeActionMenuDetailsAddedLinesCount
	autocmd ColorScheme nord highlight! link CodeActionMenuDetailsDeletedLine CodeActionMenuDetailsDeletedLinesCount
	autocmd ColorScheme nord highlight CodeActionMenuDetailsCreatedFile guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsChangedFile guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsRenamedFile guifg=%s
	autocmd ColorScheme nord highlight CodeActionMenuDetailsDeletedFile guifg=%s
	augroup END
]],
	c.comment,
	c.success,
	c.error,
	c.diff_add,
	c.diff_delete,
	c.diff_add,
	c.diff_text,
	c.diff_change,
	c.diff_delete
))
vim.cmd(string.format([[doautocmd nvim-code-action-menu-hl ColorScheme %s]], vim.g.colors_name))
