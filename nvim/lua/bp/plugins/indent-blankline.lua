require("indent_blankline").setup({
	char = "⎸",
	use_treesitter = true,
	show_first_indent_level = false,
	show_trailing_blankline_indent = false,
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
