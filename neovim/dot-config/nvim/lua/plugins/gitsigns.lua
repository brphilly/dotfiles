return {
	{
		url = "https://github.com/lewis6991/gitsigns.nvim",
		lazy = false,
		opts = {
			on_attach = function(buf)
				vim.keymap.set("n", "<leader>ga", require("gitsigns").stage_hunk, { buffer = buf, desc = "Stage hunk" })
				vim.keymap.set("x", "<leader>ga", function()
					require("gitsigns").stage_hunk({ vim.fn.line("v"), vim.fn.line(".") })
				end, { buffer = buf, desc = "Stage hunk" })
				vim.keymap.set(
					"n",
					"<leader>gu",
					require("gitsigns").undo_stage_hunk,
					{ buffer = buf, desc = "Undo stage hunk" }
				)
				vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, { buffer = buf, desc = "Reset hunk" })
				vim.keymap.set("x", "<leader>gr", function()
					require("gitsigns").reset_hunk({ vim.fn.line("v"), vim.fn.line(".") })
				end, { buffer = buf, desc = "Reset hunk" })
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").preview_hunk,
					{ buffer = buf, desc = "Preview hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>gA",
					require("gitsigns").stage_buffer,
					{ buffer = buf, desc = "Stage buffer" }
				)
				vim.keymap.set(
					"n",
					"<leader>gR",
					require("gitsigns").reset_buffer,
					{ buffer = buf, desc = "Reset buffer" }
				)
				vim.keymap.set("n", "<leader>gb", require("gitsigns").blame, { buffer = buf, desc = "Toggle blame" })
				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					else
						vim.schedule(require("gitsigns").prev_hunk)
						return "<ignore>"
					end
				end, { expr = true, buffer = buf, desc = "Go to previous hunk" })
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					else
						vim.schedule(require("gitsigns").next_hunk)
						return "<ignore>"
					end
				end, { expr = true, buffer = buf, desc = "Go to next hunk" })
			end,
		},
	},
}
