-- TODO(brphilly): Investigate leaking file descriptors
local function column()
	return '%v'
end
local function line()
	return '%l/%L'
end

require'lualine'.setup {
	options = {
		icons_enabled = true,
		theme = 'mynord',
		component_separators = {'', ''},
		section_separators = '',
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = {'mode'},
		-- lualine_b = {'branch', 'diff'},
		lualine_b = {'branch'},
		lualine_c = {{'filename', path = 0}},
		lualine_x = {},
		lualine_y = {'filetype'},
		lualine_z = {column, line},
	},
	inactive_sections = {
		lualine_a = {},
		-- lualine_b = {'branch', 'diff'},
		lualine_b = {'branch'},
		lualine_c = {{'filename', path = 0}},
		lualine_x = {'filetype'},
		lualine_y = {column, line},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}
