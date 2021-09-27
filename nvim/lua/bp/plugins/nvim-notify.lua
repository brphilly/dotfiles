vim.notify = require'notify'
vim.api.nvim_set_keymap('n', '<leader>$', '<cmd>lua require"bp.plugins.nvim-notify".print_history()<cr>', {noremap = true})
require'notify'.setup {
	stages = 'slide',
}

local c = require'nord.colours'
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
	c.purple, c.bg_float
))
vim.cmd(string.format([[doautocmd notify-hl ColorScheme %s]], vim.g.colors_name))

local M = {}
function M.print_history()
	local notifs = require'notify'.history()
	for i=math.max(#notifs - 9, 1), #notifs do
		local notif = notifs[i]
		print(string.format([[TIME: %s, LEVEL: %s]], vim.fn.strftime('%b %d %X', notif.time), notif.level))
		print('MESSAGE: ')
		for _,line in ipairs(notif.message) do
			print(line)
		end
		print(' ')
	end
end
return M
