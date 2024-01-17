return {
	{
		url = "https://github.com/LunarVim/bigfile.nvim",
		lazy = false,
		opts = {
			features = {
				{
					name = "foldcolumn",
					opts = { defer = false },
					disable = function()
						vim.wo.foldcolumn = "0"
					end,
				},
			},
		},
	},
}
