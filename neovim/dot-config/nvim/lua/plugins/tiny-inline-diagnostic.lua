return {
	{
		url = "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
		priority = 1000, -- needs to be loaded in first
		config = function()
			vim.keymap.set("n", "gl", function()
				require("tiny-inline-diagnostic").toggle()
			end, { desc = "Toggle inline diagnostics" })

			require("tiny-inline-diagnostic").setup({
				preset = "ghost",
				options = {
					multilines = true,
				},
			})
		end,
	},
}
