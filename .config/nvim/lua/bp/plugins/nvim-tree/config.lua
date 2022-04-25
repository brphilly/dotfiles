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
vim.api.nvim_create_augroup("nvim-tree-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "nvim-tree-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "NvimTreeSymlink", {fg = c.blues[4]})
	vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {fg = c.directory})
	vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", {fg = c.blues[1]})
	vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", {fg = c.blues[1]})
	vim.api.nvim_set_hl(0, "NvimTreeExecFile", {fg = c.danger})
	vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", {fg = c.yellow})
	vim.api.nvim_set_hl(0, "NvimTreeImageFile", {fg = c.blues[2]})
	vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", {fg = c.blues[3]})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "nvim-tree-hl", pattern = vim.g.colors_name})
