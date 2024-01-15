return {
	{
		url = "https://github.com/neanias/everforest-nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("everforest").setup({background = "hard", italics = true, ui_contrast = "high"})
			vim.cmd("colorscheme everforest")
		end,
	},
}
