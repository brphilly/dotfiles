return {
	{
		"OXY2DEV/markview.nvim",
		lazy = false,
		-- Force markview.nvim to be placed before treesitter in the rtp
		priority = 49,
		opts = {
			preview = {
				filetypes = { "markdown", "rmd", "quarto", "typst", "codecompanion" },
				ignore_buftypes = {},
			},
		},
	},
}
