return {
	{
		url = "https://github.com/neovim/nvim-lspconfig",
		lazy = true,
	},
	{
		url = "https://github.com/aznhe21/actions-preview.nvim",
		lazy = true,
		dependencies = { "MunifTanjim/nui.nvim" },
		init = function()
			vim.keymap.set({ "n", "x" }, "gra", require("actions-preview").code_actions, { desc = "Show code actions" })
		end,
	},
	{
		url = "https://github.com/onsails/lspkind.nvim",
		lazy = true,
	},
	{
		url = "https://github.com/creativenull/efmls-configs-nvim",
		version = "^1",
		lazy = true,
		dependencies = { "neovim/nvim-lspconfig" },
	},
}
