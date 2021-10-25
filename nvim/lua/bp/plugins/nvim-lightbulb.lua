vim.cmd(string.format(
	[[
		augroup nvim-lightbulb-update
		autocmd!
		autocmd CursorHold * lua require('nvim-lightbulb').update_lightbulb(%s)
		augroup END
	]],
	[[{ sign = { enabled = false }, status_text = { enabled = true } }]]
))

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup nvim-lightbulb-hl
	autocmd!
	autocmd ColorScheme nord highlight LightBulbFloatWin guibg=%s
	augroup END
]],
	c.bg,
	c.danger
))
vim.cmd(string.format([[doautocmd nvim-lightbulb-hl ColorScheme %s]], vim.g.colors_name))
