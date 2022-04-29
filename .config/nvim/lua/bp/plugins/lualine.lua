-- TODO(brphilly): Investigate leaking file descriptors when opening multiple projects
local colours = require("nord.colours")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "mynord",
		component_separators = { left = "", right = "" },
		section_separators = "",
		disabled_filetypes = {},
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{"diff", diff_color = {added = {fg = colours.green}, modified = {fg = colours.blues[1]}, removed = {fg = colours.red}}},
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_c = { "require('nvim-lightbulb').get_status_text()" },
		lualine_x = {},
		lualine_y = { { "filename", path = 1 }, "filetype" },
		lualine_z = { "%v", "%l/%L" },
	},
	extensions = { "quickfix", "nvim-tree", "fzf" },
})
