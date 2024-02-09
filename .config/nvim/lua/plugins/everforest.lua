return {
	{
		url = "https://github.com/neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({
				background = "hard",
				italics = true,
				ui_contrast = "high",
				diagnostic_line_highlight = true,
				on_highlights = function(hl, palette)
					hl.DiagnosticUnnecessary = { link = "Conceal" }
				end,
			})
			vim.cmd("colorscheme everforest")
		end,
	},
}
