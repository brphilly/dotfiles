require("bqf").setup({
	func_map = {
		tab = "<c-t>",
		stoggleup = "",
		stoggledown = "s",
		stogglevm = "s",
		stogglebuf = "'s",
		sclear = "zs",
	},
})

local c = require("nord.colours")
vim.cmd(string.format([[
	augroup bqf-hl
	autocmd!
	autocmd ColorScheme nord highlight! link BqfPreviewFloat NormalFloat
	autocmd ColorScheme nord highlight! link BqfPreviewBorder FloatBorder
	autocmd ColorScheme nord highlight! link BqfPreviewRange Visual
	autocmd ColorScheme nord highlight BqfSign guifg=%s
	augroup END
]],
	c.attention
))
vim.cmd(string.format([[doautocmd bqf-hl ColorScheme %s]], vim.g.colors_name))
