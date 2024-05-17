return {
	{
		url = "https://github.com/sourcegraph/sg.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			vim.keymap.set("n", "<leader>a", "<cmd>CodyChat<cr>")
			vim.keymap.set("n", "<leader>A", "<cmd>CodyChat!<cr>")
		end,
		config = true,
	},
}
