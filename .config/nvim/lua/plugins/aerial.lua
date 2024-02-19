return {
	{
		url = "https://github.com/stevearc/aerial.nvim",
		cmd = "AerialToggle",
		init = function()
			vim.keymap.set("n", "gs", "<cmd>AerialToggle<cr>")
		end,
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			layout = { default_direction = "prefer_left" },
			show_guides = true,
		},
	},
}
