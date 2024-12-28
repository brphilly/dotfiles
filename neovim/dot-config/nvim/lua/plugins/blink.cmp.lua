return {
	{
		url = "https://github.com/saghen/blink.cmp",
		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },
			completion = {
				list = { selection = "auto_insert" },
			},
		},
	},
}
