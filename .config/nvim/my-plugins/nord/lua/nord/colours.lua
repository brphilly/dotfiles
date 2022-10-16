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
colours.purples = {
	"#a093c7",
	p.purple
}

colours.bg = utils.darken(colours.darks[1], 0.3)
colours.bg_float = utils.darken(colours.bg, 0.3)
colours.bg_hl = utils.darken(colours.darks[1], 0.1)

colours.fg = colours.lights[1]
colours.fg_fade = utils.darken(colours.fg, 0.5)
colours.fg_hl = colours.lights[2]
colours.comment = utils.blend(colours.fg, colours.bg, 0.75)

colours.border = colours.lights[3]
colours.visual_fade = colours.darks[1]
colours.visual = colours.darks[3]
colours.search = colours.darks[4]
colours.incsearch = colours.blues[4]
colours.selection = utils.blend(colours.blues[1], colours.bg, 0.7)
colours.title = colours.blues[2]
colours.status = colours.darks[1]
colours.directory = colours.purples[1]

colours.string = colours.blues[2]
colours.number = colours.green
colours.func = colours.blues[3]
colours.keyword = colours.blues[1]
colours.macro = colours.blues[4]
colours.type = colours.purples[1]
colours.tag = colours.orange
colours.escape = colours.blues[4]

colours.diff_add = colours.green
colours.diff_change = colours.blues[1]
colours.diff_delete = colours.red
colours.diff_text = colours.blues[3]
colours.diff_add_fade = utils.blend(colours.bg, colours.green, 0.7)
colours.diff_change_fade = utils.blend(colours.bg, colours.blues[1], 0.6)
colours.diff_delete_fade = utils.blend(colours.bg, colours.red, 0.7)
colours.diff_text_fade = utils.blend(colours.bg, colours.blues[3], 0.6)

colours.error = colours.red
colours.warning = colours.yellow
colours.info = colours.blues[4]
colours.hint = colours.blues[2]
colours.danger = colours.orange
colours.note = colours.blues[3]
colours.todo = colours.yellow
colours.attention = colours.green
colours.attention_alt = colours.orange
colours.success = colours.green

return colours
