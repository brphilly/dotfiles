local p = require("nord.palette")
local utils = require("nord.utils")
local colours = {}

colours.darks = {
	p.darks[1],
	p.darks[2],
	p.darks[3],
	p.darks[4],
}
colours.lights = {
	p.lights[1],
	p.lights[2],
	p.lights[3],
}
colours.blues = {
	p.blues[1],
	p.blues[2],
	p.blues[3],
	p.blues[4],
}
colours.red = p.red
colours.orange = p.orange
colours.yellow = p.yellow
colours.green = p.green
colours.purple = "#a093c7"

colours.fg = colours.lights[1]
colours.bg = utils.darken(colours.darks[1], 0.3)

colours.fg_fade = utils.darken(colours.fg, 0.5)
colours.comment = utils.blend(colours.fg, colours.bg, 0.75)

colours.bg_float = utils.darken(colours.bg, 0.3)
colours.bg_hl = utils.darken(colours.darks[1], 0.1)

colours.border = colours.lights[3]
colours.visual = colours.darks[3]
colours.search = colours.darks[4]
colours.selection = utils.blend(colours.blues[1], colours.bg, 0.7)
colours.title = colours.green

colours.diff_add = utils.blend(colours.bg, colours.green, 0.7)
colours.diff_change = utils.blend(colours.bg, colours.blues[1], 0.6)
colours.diff_delete = utils.blend(colours.bg, colours.red, 0.7)
colours.diff_text = utils.blend(colours.bg, colours.blues[3], 0.6)

colours.error = colours.red
colours.warning = colours.yellow
colours.info = colours.blues[4]
colours.hint = colours.blues[1]
colours.danger = colours.orange
colours.note = colours.blues[3]
colours.todo = colours.yellow

return colours
