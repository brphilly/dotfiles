require('gitsigns').setup {
	signs = {
		add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
		change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
		delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
		changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	},
	numhl = false,
	linehl = false,
	sign_priority = 6,

	keymaps = {
		-- Default keymap options
		noremap = true,

		['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
		['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

		['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['x <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
		['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['x <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

		-- Text objects
		['o ih'] = {silent = true, ':<C-U>lua require"gitsigns".select_hunk()<CR>'},
		['x ih'] = {silent = true, ':<C-U>lua require"gitsigns".select_hunk()<CR>'},
	},
}

local c = require'nord.colours'
vim.cmd(string.format([[
augroup gitsigns-hl
autocmd!
autocmd ColorScheme nord highlight GitSignsAdd guifg=%s
autocmd ColorScheme nord highlight GitSignsChange guifg=%s
autocmd ColorScheme nord highlight GitSignsDelete guifg=%s
augroup END
	]],
	c.green,
	c.blues[1],
	c.red
))
vim.cmd(string.format([[doautocmd gitsigns-hl ColorScheme %s]], vim.g.colors_name))
