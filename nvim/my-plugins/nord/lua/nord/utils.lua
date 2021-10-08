local M = {}

function M.blend(colour1, colour2, alpha)
	local rgb = { 0, 0, 0 }
	for i in ipairs(rgb) do
		local str1 = colour1:sub(2 * i, 2 * i + 1)
		local str2 = colour2:sub(2 * i, 2 * i + 1)
		rgb[i] = math.floor(alpha * tonumber(str1, 16) + (1 - alpha) * tonumber(str2, 16) + 0.5)
	end

	return string.format("#%02x%02x%02x", rgb[1], rgb[2], rgb[3])
end

function M.darken(colour, percent)
	return M.blend("#000000", colour, percent)
end

function M.lighten(colour, percent)
	return M.blend("#FFFFFF", colour, percent)
end

function M.build_hlstr(hlgroup, opts)
	local hlcmd
	if opts.link then
		hlcmd = string.format("highlight! link %s %s", hlgroup, opts.link)
	else
		local fg = opts.fg and "guifg=" .. opts.fg or "guifg=NONE"
		local bg = opts.bg and "guibg=" .. opts.bg or "guibg=NONE"
		local sp = opts.sp and "guisp=" .. opts.sp or "guisp=NONE"
		local att = opts.att and "gui=" .. opts.att or "gui=NONE"

		hlcmd = string.format("highlight %s %s %s %s %s", hlgroup, fg, bg, sp, att)
	end
	return hlcmd
end

return M
