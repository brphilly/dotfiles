return {
	{
		url = "https://github.com/stevearc/oil.nvim",
		cmd = "Oil",
		opts = {view_options = {show_hidden = true}},
		init = function()
			vim.keymap.set("n", "-", function() require("oil").open() end)
			vim.keymap.set("n", "_", function() require("oil").open(vim.fn.getcwd()) end)
		end,
	},
}
