vim.g.nvim_tree_ignore = { ".git", ".DS_Store" }

local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
	-- closes neovim automatically when the tree is the last **WINDOW** in the view
	auto_close = true,
	-- hijack the cursor in the tree to put it at the start of the filename
	hijack_cursor = true,
	-- show lsp diagnostics in the signcolumn
	diagnostics = { enable = true },
	view = {
		mappings = {
			list = {
				{ key = "<CR>", cb = tree_cb("preview") },
				{ key = "<Tab>", cb = tree_cb("edit") },
			},
		},
	},
})

vim.api.nvim_set_keymap("n", "<leader>cv", '<cmd>NvimTreeClose<cr><cmd>lua require"bp.keymap-funcs".make_session(true)<cr>', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ss", '<cmd>NvimTreeClose<cr><cmd>lua require"bp.keymap-funcs".make_session(false)<cr>', { noremap = true })

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
	c.purple,
	c.blues[1],
	c.blues[1],
	c.danger,
	c.yellow,
	c.blues[2],
	c.blues[3]
))
vim.cmd(string.format([[doautocmd nvim-tree-hl ColorScheme %s]], vim.g.colors_name))
