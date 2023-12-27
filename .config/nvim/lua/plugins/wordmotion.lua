return {
	{
		url = "https://github.com/chaoren/vim-wordmotion",
		keys = "<space>",
		event = "ModeChanged *:no*",
		init = function() vim.g.wordmotion_prefix = "<space>" end,
	},
}
