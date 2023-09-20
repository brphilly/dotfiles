require("indent_blankline").setup({
	char = "▎",
	context_char = "▎",
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
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
