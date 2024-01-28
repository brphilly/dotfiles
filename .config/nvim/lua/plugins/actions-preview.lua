return {
	{
		url = "https://github.com/aznhe21/actions-preview.nvim",
		lazy = true,
		init = function()
			vim.keymap.set({ "n", "x" }, "ga", require("actions-preview").code_actions)
		end,
	},
}
