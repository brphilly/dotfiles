-- TODO(brphilly): Investigate leaking file descriptors
local colours = require("nord.colours")

local lsp_progress = {
	"lsp_progress",
	spinner_symbols = { "⣾", "⣷", "⣯", "⣟", "⡿", "⢿", "⣻", "⣽" },
	timer = { spinner = 100 },
	colors = {
		percentage = colours.title,
		title = colours.title,
		message = colours.fg,
		spinner = colours.yellow,
		lsp_client_name = colours.comment,
		use = true,
	},
}
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
			{ "diagnostics", sources = { "nvim_lsp" } },
		},
		lualine_c = {},
		lualine_x = { lsp_progress },
		lualine_y = { { "filename", path = 0 }, "filetype" },
		lualine_z = { "%v", "%l/%L" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			"branch",
			diff,
			{ "diagnostics", sources = { "nvim_lsp" } },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = { { "filename", path = 0 }, "filetype" },
		lualine_z = { "%v", "%l/%L" },
	},
	tabline = {},
	extensions = { "quickfix", "nvim-tree" },
})
