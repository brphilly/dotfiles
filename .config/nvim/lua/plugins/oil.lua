return {
	{
		url = "https://github.com/stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		cmd = "Oil",
		opts = {
			delete_to_trash = true,
		},
		init = function()
			vim.keymap.set("n", "-", "<cmd>Oil --float<cr>")
		end,
	},
}
