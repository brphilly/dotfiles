return {
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = {"CursorMoved", "CursorHold"},
		config = function()
			require("lsp_lines").setup()
			vim.keymap.set("n", "<leader><leader>", require("lsp_lines").toggle)
		end,
	},
}