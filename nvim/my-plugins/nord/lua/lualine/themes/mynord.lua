local colours = require("nord.colours")
return {
	normal = {
		a = { bg = colours.blues[3], fg = colours.bg, gui = "bold" },
		b = { bg = colours.bg_float, fg = colours.fg },
		c = { bg = colours.visual, fg = colours.fg },
	},
	insert = { a = { bg = colours.blues[1], fg = colours.bg, gui = "bold" } },
	replace = { a = { bg = colours.green, fg = colours.bg, gui = "bold" } },
	visual = { a = { bg = colours.purple, fg = colours.bg, gui = "bold" } },
	command = { a = { bg = colours.yellow, fg = colours.bg, gui = "bold" } },
	inactive = {
		a = { bg = colours.bg_hl, fg = colours.fg_fade, gui = "bold" },
		b = { bg = colours.bg_hl, fg = colours.fg_fade },
		c = { bg = colours.bg_hl, fg = colours.fg_fade },
	},
}
