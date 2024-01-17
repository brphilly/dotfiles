return {
	{
		url = "https://github.com/kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = {
			{ url = "https://github.com/kevinhwang91/promise-async", lazy = true },
		},
		config = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
			vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
			vim.keymap.set("n", "zm", require("ufo").closeFoldsWith)

			require("ufo").setup()
		end,
	},
}
