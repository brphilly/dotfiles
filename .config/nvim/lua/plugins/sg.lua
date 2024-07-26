return {
	{
		url = "https://github.com/sourcegraph/sg.nvim",
		lazy = true,
		event = "VimEnter", -- after project local config which may disable AI
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("sg").setup({
				enable_cody = Enable_ai,
				chat = {
					default_model = "anthropic/claude-3-5-sonnet-20240620",
				},
			})
		end,
	},
}
