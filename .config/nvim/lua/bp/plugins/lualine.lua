-- TODO(brphilly): Investigate leaking file descriptors
local colours = require("nord.colours")

local diff = {
	"diff",
	diff_color = {
		added = { fg = colours.green },
		modified = { fg = colours.blues[1] },
		removed = { fg = colours.red },
	},
}

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
			diff,
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_c = { "require('nvim-lightbulb').get_status_text()" },
		lualine_x = {},
		lualine_y = { { "filename", path = 1 }, "filetype" },
		lualine_z = { "%v", "%l/%L" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			"branch",
			vim.tbl_extend("force", diff, { colored = false }),
			{ "diagnostics", sources = { "nvim_diagnostic" }, colored = false },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { { "filename", path = 1 }, "filetype" },
		lualine_z = { "%v", "%l/%L" },
	},
	tabline = {},
	extensions = { "quickfix", "nvim-tree" },
})
