require("indent_blankline").setup({
	char = "▎",
	context_char = "▎",
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	context_start_priority = 125,
	filetype_exclude = {
		"help",
		"text",
		"startify",
		"packer",
		"NeogitStatus",
		"NeogitLogView",
		"NeogitPopup",
	},
	buftype_exclude = { "terminal" },
})
