return {
	{
		url = "https://github.com/rcarriga/nvim-notify",
		lazy = true,
		version = "^3",
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.notify = function(...)
				require("lazy").load({ plugins = { "nvim-notify" } })
				return vim.notify(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.notify_once = function(...)
				require("lazy").load({ plugins = { "nvim-notify" } })
				return vim.notify_once(...)
			end
		end,
		config = function()
			require("notify").setup({
				stages = "slide",
			})
			vim.notify = require("notify")
			vim.keymap.set("n", "<leader>$", "<cmd>Notifications<cr>", { desc = "Show notification history" })
		end,
	},
}
