return {
	{
		url = "https://github.com/supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim.completion_preview").suggestion_group = "Conceal"
			require("supermaven-nvim").setup({
				log_level = "warn",
				keymaps = {
					accept_suggestion = "<C-j>",
					accept_word = "<C-right>",
				},
			})
		end,
	},
}
