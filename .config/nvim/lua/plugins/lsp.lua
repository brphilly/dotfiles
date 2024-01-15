return {
	{
		url = "https://github.com/neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		url = "https://github.com/creativenull/efmls-configs-nvim",
		version = "^1",
		lazy = true,
		dependencies = { "neovim/nvim-lspconfig" },
	},
}
