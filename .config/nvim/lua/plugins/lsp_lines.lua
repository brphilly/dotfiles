return {
	{
		url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		event = "DiagnosticChanged",
		config = function()
			require("lsp_lines").setup()
			vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
			vim.keymap.set("n", "gl", function()
				local diag_conf = vim.diagnostic.config()
				if diag_conf.virtual_lines then
					vim.diagnostic.config({ virtual_lines = false })
				else
					vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
				end
			end, { desc = "Toggle current line lsp_lines" })

			vim.keymap.set("n", "gL", function()
				local diag_conf = vim.diagnostic.config()
				if diag_conf.virtual_lines == true then
					vim.diagnostic.config({ virtual_lines = false })
				else
					vim.diagnostic.config({ virtual_lines = true })
				end
			end, { desc = "Toggle all lsp_lines" })
		end,
	},
}
