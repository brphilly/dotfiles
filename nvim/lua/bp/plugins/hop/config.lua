require'hop'.setup {
	quit_key = '<c-[>',
}
local c = require'nord.colours'
vim.cmd(string.format([[
	augroup hop-hl
	autocmd!
	autocmd ColorScheme nord highlight HopNextKey guifg=%s gui=bold,nocombine
	autocmd ColorScheme nord highlight HopNextKey1 guifg=%s gui=bold,nocombine
	autocmd ColorScheme nord highlight HopNextKey2 guifg=%s gui=bold,nocombine
	augroup END
]],
	c.red,
	c.blues[3],
	c.blues[2]
))
vim.cmd(string.format([[doautocmd hop-hl ColorScheme %s]], vim.g.colors_name))
