require("pounce").setup({
  multi_window = false,
})

local p = require("nord.colours")
vim.cmd(string.format([[
	augroup pounce-hl
	autocmd!
	autocmd ColorScheme nord highlight PounceMatch guifg=%s guibg=%s
	autocmd ColorScheme nord highlight PounceGap guifg=%s guibg=%s
	autocmd ColorScheme nord highlight PounceAccept guifg=%s guibg=%s
	autocmd ColorScheme nord highlight PounceAcceptBest guifg=%s guibg=%s
	augroup END
]],
	p.comment, p.search,
	p.fg_fade, p.search,
	p.bg, p.attention_alt,
	p.bg, p.attention
))
vim.cmd(string.format([[doautocmd pounce-hl ColorScheme %s]], vim.g.colors_name))
