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
