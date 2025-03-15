return {
	{
		url = "https://github.com/folke/trouble.nvim",
		config = function()
			require("trouble").setup({})
		end,
		init = function()
			vim.keymap.set(
				"n",
				"<leader>td",
				"<cmd>Trouble diagnostics toggle<cr>",
				{ desc = "Toggle workspace diagnostics in trouble" }
			)
			vim.keymap.set(
				"n",
				"<leader>tD",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				{ desc = "Toggle buffer diagnostics in trouble" }
			)
			vim.keymap.set(
				"n",
				"<leader>tq",
				"<cmd>Trouble quickfix toggle<cr>",
				{ desc = "Toggle quickfix in trouble" }
			)
			vim.keymap.set(
				"n",
				"<leader>ts",
				"<cmd>Trouble lsp_document_symbols toggle win.relative=win win.position=left win.size=50<cr>",
				{ desc = "Toggle document symbols in trouble" }
			)
			vim.keymap.set("n", "<leader>tl", "<cmd>Trouble lsp toggle<cr>", { desc = "Toggle symbol info in trouble" })
			vim.keymap.set(
				"n",
				"<leader>ti",
				"<cmd>Trouble lsp_incoming_calls toggle win.relative=win win.position=left win.size=50<cr>",
				{ desc = "Toggle incoming calls in trouble" }
			)
			vim.keymap.set(
				"n",
				"<leader>to",
				"<cmd>Trouble lsp_outgoing_calls toggle win.relative=win win.position=left win.size=50<cr>",
				{ desc = "Toggle outgoing calls in trouble" }
			)
		end,
		cmd = "Trouble",
	},
}
