local c = require'nord.colours'
vim.cmd(string.format([[
	augroup lightspeed-hl
	autocmd!
	autocmd ColorScheme nord highlight LightspeedGreyWash guifg=%s
	autocmd ColorScheme nord highlight LightspeedMaskedChar guifg=%s
	autocmd ColorScheme nord highlight LightspeedLabel guifg=%s gui=bold
	autocmd ColorScheme nord highlight LightspeedLabelOverlapped guifg=%s gui=bold
	autocmd ColorScheme nord highlight LightspeedLabelDistant guifg=%s gui=bold
	autocmd ColorScheme nord highlight LightspeedLabelDistantOverlapped guifg=%s gui=bold
	autocmd ColorScheme nord highlight LightspeedUnlabeledMatch guifg=%s gui=bold
	autocmd ColorScheme nord highlight LightspeedOneCharMatch guifg=%s guibg=%s
	autocmd ColorScheme nord highlight LightspeedShortcut guifg=%s guibg=NONE gui=bold
	autocmd ColorScheme nord highlight LightspeedShortcutOverlapped guifg=%s guibg=NONE gui=bold
	autocmd ColorScheme nord highlight LightspeedPendingOpArea guifg=%s guibg=%s
	augroup END
]],
	c.fg_fade,
	c.comment,
	c.yellow,
	c.orange,
	c.blues[3],
	c.blues[2],
	c.green,
	c.bg, c.yellow,
	c.green,
	c.blues[4],
	c.bg, c.yellow
))
vim.cmd(string.format([[doautocmd lightspeed-hl ColorScheme %s]], vim.g.colors_name))
