vim.cmd(string.format(
	[[
		augroup nvim-lightbulb-update
		autocmd!
		autocmd CursorMoved * lua require('nvim-lightbulb').update_lightbulb(%s)
		augroup END
	]],
	[[{ sign = { enabled = true, priority = 14 }, status_text = { enabled = true } }]]
))

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup nvim-lightbulb-hl
	autocmd!
	autocmd ColorScheme nord highlight LightBulbFloatWin guibg=%s
	autocmd ColorScheme nord highlight LightBulbSign guifg=%s
	augroup END
]],
	c.bg,
	c.danger
))
vim.cmd(string.format([[doautocmd nvim-lightbulb-hl ColorScheme %s]], vim.g.colors_name))
vim.fn.sign_define("LightBulbSign", { numhl = "LightBulbSign" })
