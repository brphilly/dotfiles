local colours = require("nord.colours")
return {
	normal = {
		a = { bg = colours.blues[3], fg = colours.bg, gui = "bold" },
		b = { bg = colours.bg_float, fg = colours.fg },
		c = { bg = colours.status, fg = colours.fg },
	},
	insert = { a = { bg = colours.fg, fg = colours.bg, gui = "bold" } },
	replace = { a = { bg = colours.blues[4], fg = colours.bg, gui = "bold" } },
	visual = { a = { bg = colours.yellow, fg = colours.bg, gui = "bold" } },
	command = { a = { bg = colours.purples[1], fg = colours.bg, gui = "bold" } },
	inactive = {
		a = { bg = colours.bg_hl, fg = colours.fg_fade, gui = "bold" },
		b = { bg = colours.bg_hl, fg = colours.fg_fade },
		c = { bg = colours.bg_hl, fg = colours.fg_fade },
	},
}
