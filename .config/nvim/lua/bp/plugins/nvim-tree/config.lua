require("nvim-tree").setup({
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor = true,
	-- show lsp diagnostics in the signcolumn
	diagnostics = { enable = true },
	view = {
		mappings = {
			list = {
				{ key = "-", action = "close" },
				{ key = "<c-s>", action = "split" },
			},
		},
	},
	filters = {
		custom = { "^\\.git", "^\\.DS_Store" },
	},
	update_focused_file = { enable = true }
})

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
	augroup nvim-tree-hl
	autocmd!
	autocmd ColorScheme nord highlight NvimTreeSymlink guifg=%s
	autocmd ColorScheme nord highlight NvimTreeRootFolder guifg=%s
	autocmd ColorScheme nord highlight NvimTreeFolderIcon guifg=%s
	autocmd ColorScheme nord highlight NvimTreeIndentMarker guifg=%s
	autocmd ColorScheme nord highlight NvimTreeExecFile guifg=%s
	autocmd ColorScheme nord highlight NvimTreeSpecialFile guifg=%s
	autocmd ColorScheme nord highlight NvimTreeImageFile guifg=%s
	autocmd ColorScheme nord highlight NvimTreeOpenedFile guifg=%s
	augroup END
]],
	c.blues[4],
	c.directory,
	c.blues[1],
	c.blues[1],
	c.danger,
	c.yellow,
	c.blues[2],
	c.blues[3]
))
vim.cmd(string.format([[doautocmd nvim-tree-hl ColorScheme %s]], vim.g.colors_name))
