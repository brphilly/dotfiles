return {
	{
		url = "https://github.com/windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		url = "https://github.com/windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-treesitter.configs").setup({
				autotag = {
					enable = true,
				},
			})
			require("nvim-ts-autotag").setup({})
		end,
	},
}
