return {
	{
		url = "https://github.com/tpope/vim-surround",
		keys = {
			"ds", "cs", "cS", "ys", "yS", "yss", "ySs", "ySS",
			{"S", mode = "x"}, {"gS", mode = "x"},
		},
		dependencies = {
			{url = "https://github.com/tpope/vim-repeat"},
		},
		init = function() vim.g.surround_no_insert_mappings = true end,
	},
}
