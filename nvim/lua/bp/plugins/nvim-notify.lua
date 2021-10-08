vim.notify = require("notify")
vim.api.nvim_set_keymap("n", "<leader>$", "<cmd>Notifications<cr>", { noremap = true })
require("notify").setup({
	stages = "slide",
})

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup notify-hl
	autocmd!
	autocmd ColorScheme nord highlight NotifyERRORBorder guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyWARNBorder guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyINFOBorder guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyDEBUGBorder guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyTRACEBorder guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyERRORIcon guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyWARNIcon guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyINFOIcon guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyDEBUGIcon guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyTRACEIcon guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyERRORTitle  guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyWARNTitle guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyINFOTitle guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyDEBUGTitle  guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyTRACETitle  guifg=%s guibg=%s
	autocmd ColorScheme nord highlight NotifyLogTitle  guifg=%s
	autocmd ColorScheme nord highlight! link NotifyERRORBody NormalFloat
	autocmd ColorScheme nord highlight! link NotifyWARNBody NormalFloat
	autocmd ColorScheme nord highlight! link NotifyINFOBody NormalFloat
	autocmd ColorScheme nord highlight! link NotifyDEBUGBody NormalFloat
	autocmd ColorScheme nord highlight! link NotifyTRACEBody NormalFloat
	augroup END
]],
	c.error, c.bg_float,
	c.warning, c.bg_float,
	c.info, c.bg_float,
	c.danger, c.bg_float,
	c.purple, c.bg_float,
	c.error, c.bg_float,
	c.warning, c.bg_float,
	c.info, c.bg_float,
	c.danger, c.bg_float,
	c.purple, c.bg_float,
	c.error, c.bg_float,
	c.warning, c.bg_float,
	c.info, c.bg_float,
	c.danger, c.bg_float,
	c.purple, c.bg_float,
	c.title
))
vim.cmd(string.format([[doautocmd notify-hl ColorScheme %s]], vim.g.colors_name))
