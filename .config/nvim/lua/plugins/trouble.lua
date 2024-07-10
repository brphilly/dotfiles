return {
	{
		url = "https://github.com/folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
			require("fzf-lua.config").defaults.actions.files["ctrl-t"] = require("trouble.sources.fzf").actions.open
		end,
		init = function()
			vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>")
			vim.keymap.set("n", "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
			vim.keymap.set("n", "<leader>tq", "<cmd>Trouble quickfix toggle<cr>")
			vim.keymap.set("n", "<leader>tf", "<cmd>Trouble fzf toggle<cr>")
			vim.keymap.set(
				"n",
				"<leader>ts",
				"<cmd>Trouble lsp_document_symbols toggle win.relative=win win.position=left win.size=50<cr>"
			)
			vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>")
			vim.keymap.set(
				"n",
				"<leader>ti",
				"<cmd>Trouble lsp_incoming_calls toggle win.relative=win win.position=left win.size=50<cr>"
			)
			vim.keymap.set(
				"n",
				"<leader>to",
				"<cmd>Trouble lsp_outgoing_calls toggle win.relative=win win.position=left win.size=50<cr>"
			)
		end,
		cmd = "Trouble",
	},
}
