return {
	{
		url = "https://github.com/rcarriga/nvim-notify",
		lazy = false,
		version = "^3",
		config = function()
			require("notify").setup({
				stages = "slide",
			})
			vim.notify = require("notify")
			vim.keymap.set("n", "<leader>$", "<cmd>Notifications<cr>")
		end,
	},
}
