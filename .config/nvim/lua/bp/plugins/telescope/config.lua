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
vim.api.nvim_create_augroup("telescope-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "telescope-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "TelescopeSelection", {bg = c.selection})
	vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {fg = c.attention})
	vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {fg = c.attention})
	vim.api.nvim_set_hl(0, "TelescopeMatching", {fg = c.attention})
	vim.api.nvim_set_hl(0, "TelescopeNormal", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "TelescopePreviewNormal", {link = "TelescopeNormal"})
	vim.api.nvim_set_hl(0, "TelescopeBorder", {link = "FloatBorder"})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "telescope-hl", pattern = vim.g.colors_name})
