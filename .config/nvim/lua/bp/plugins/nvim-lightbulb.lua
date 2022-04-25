vim.api.nvim_create_augroup("nvim-lightbulb-update", {})
vim.api.nvim_create_autocmd("CursorHold", {group = "nvim-lightbulb-update", callback = function()
	require("nvim-lightbulb").update_lightbulb({sign = {enabled = false}, status_text = {enabled = true}})
end})

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup nvim-lightbulb-hl
	autocmd!
	autocmd ColorScheme nord highlight LightBulbFloatWin guibg=%s
	augroup END
]],
	c.bg
))
vim.cmd(string.format([[doautocmd nvim-lightbulb-hl ColorScheme %s]], vim.g.colors_name))
