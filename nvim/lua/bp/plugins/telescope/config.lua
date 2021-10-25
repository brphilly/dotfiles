local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%.DS_Store", "%.git/.*" },
		layout_strategy = "flex",
		path_display = { truncate = 1 },
		mappings = {
			i = {
				["<C-[>"] = actions.close,
			},
		},
		dynamic_preview_title = true,
	},
	pickers = {
		-- Your special builtin config goes in here
		buffers = {
			sort_mru = true,
			mappings = {
				i = {
					["<c-c>"] = actions.delete_buffer,
				},
				n = {
					["<c-c>"] = actions.delete_buffer,
				},
			},
		},
		file_browser = {
			hidden = true,
		},
		help_tags = {
			mappings = {
				i = {
					["<cr>"] = actions.select_vertical,
				},
			},
		},
	},
})

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup telescope-hl
	autocmd!
	autocmd ColorScheme nord highlight TelescopeSelection guibg=%s
	autocmd ColorScheme nord highlight TelescopeSelectionCaret guifg=%s
	autocmd ColorScheme nord highlight TelescopePromptPrefix guifg=%s
	autocmd ColorScheme nord highlight TelescopeMatching guifg=%s
	autocmd ColorScheme nord highlight! link TelescopeNormal NormalFloat
	autocmd ColorScheme nord highlight! link TelescopePreviewNormal TelescopeNormal
	autocmd ColorScheme nord highlight! link TelescopeBorder FloatBorder
	augroup END
]],
	c.selection,
	c.yellow,
	c.yellow,
	c.yellow
))
vim.cmd(string.format([[doautocmd telescope-hl ColorScheme %s]], vim.g.colors_name))
