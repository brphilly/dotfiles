return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Notes",
					path = "~/Notes",
				},
			},
			ui = { enable = false },
			picker = {
				name = "fzf-lua",
			},
		},
	},
}
