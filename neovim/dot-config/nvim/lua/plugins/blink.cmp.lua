return {
	{
		url = "https://github.com/saghen/blink.cmp",
		version = "1.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "super-tab" },
			completion = {
				list = { selection = { preselect = false } },
			},
			cmdline = {
				completion = { menu = { auto_show = true } },
				keymap = { preset = "super-tab" },
			},
			sources = {
				default = {
					"lsp",
					"path",
					"buffer",
					"snippets",
				},
			},
		},
	},
}
