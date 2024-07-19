return {
	{
		url = "https://github.com/stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			delete_to_trash = true,
			win_options = {
				signcolumn = "yes:2",
				statuscolumn = "",
			},
			view_options = {
				show_hidden = true,
			},
		},
		init = function()
			vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open oil in float" })
		end,
	},
	{
		url = "https://github.com/refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
}
