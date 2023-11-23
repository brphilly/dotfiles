return {
	{
		url = "https://github.com/tpope/vim-surround",
		keys = {
			{"n","ds"}, {"n","cs"}, {"n","cS"}, {"n","ys"}, {"n","yS"}, {"n","yss"}, {"n","ySs"}, {"n","ySS"},
			{"x","S"}, {"x","gS"},
		},
		dependencies = {
			{url = "https://github.com/tpope/vim-repeat"},
		},
		init = function() vim.g.surround_no_insert_mappings = true end,
	},
}
