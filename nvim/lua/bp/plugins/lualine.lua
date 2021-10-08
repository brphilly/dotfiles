-- TODO(brphilly): Investigate leaking file descriptors
local colours = require("nord.colours")

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "mynord",
		component_separators = { left = "", right = "" },
		section_separators = "",
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = { fg = colours.green },
					modified = { fg = colours.blues[1] },
					removed = { fg = colours.red },
				},
			},
		},
		lualine_c = { { "filename", path = 0 } },
		lualine_x = { "filetype" },
		lualine_y = { { "diagnostics", sources = { "nvim_lsp" } } },
		lualine_z = { "%v", "%l/%L" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = { fg = colours.green },
					modified = { fg = colours.blues[1] },
					removed = { fg = colours.red },
				},
			},
		},
		lualine_c = { { "filename", path = 0 } },
		lualine_x = { "filetype" },
		lualine_y = { { "diagnostics", sources = { "nvim_lsp" } } },
		lualine_z = { "%v", "%l/%L" },
	},
	tabline = {},
	extensions = {},
})
