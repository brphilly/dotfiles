return {
	{
		url = "https://github.com/sourcegraph/sg.nvim",
		lazy = true,
		event = "VimEnter", -- after project local config which may disable AI
		dependencies = { "nvim-lua/plenary.nvim" },
		init = function()
			vim.keymap.set("n", "<leader>a", "<cmd>CodyChat<cr>")
			vim.keymap.set("n", "<leader>A", "<cmd>CodyChat!<cr>")
		end,
		config = function()
			require("sg").setup({
				enable_cody = Enable_ai,
			})
		end,
	},
}
