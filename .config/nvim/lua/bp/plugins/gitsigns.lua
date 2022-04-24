require("gitsigns").setup({
	on_attach = function(buf)
		vim.keymap.set("n", "<leader>ga", require("gitsigns").stage_hunk, {buffer = buf})
		vim.keymap.set("x", "<leader>ga", function() require("gitsigns").stage_hunk({vim.fn.line("v"), vim.fn.line(".")}) end, {buffer = buf})
		vim.keymap.set("n", "<leader>gu", require("gitsigns").undo_stage_hunk, {buffer = buf})
		vim.keymap.set("n", "<leader>gr", require("gitsigns").reset_hunk, {buffer = buf})
		vim.keymap.set("x", "<leader>gr", function() require("gitsigns").reset_hunk({vim.fn.line("v"), vim.fn.line(".")}) end, {buffer = buf})
		vim.keymap.set("n", "<leader>gp", require("gitsigns").preview_hunk, {buffer = buf})
		vim.keymap.set("n", "<leader>gA", require("gitsigns").stage_buffer, {buffer = buf})
		vim.keymap.set("n", "<leader>gR", require("gitsigns").reset_buffer, {buffer = buf})
		vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line({full = true}) end, {buffer = buf})
		vim.keymap.set("o", "ic", require("gitsigns").select_hunk, {buffer = buf})
		vim.keymap.set("x", "ic", require("gitsigns").select_hunk, {buffer = buf})
		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				return "[c"
			else
				vim.schedule(require("gitsigns").prev_hunk)
				return "<ignore>"
			end
		end, {expr = true, buffer = buf})
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				return "]c"
			else
				vim.schedule(require("gitsigns").next_hunk)
				return "<ignore>"
			end
		end, {expr = true, buffer = buf})
	end,
})

local c = require("nord.colours")
-- stylua: ignore
vim.cmd(string.format([[
augroup gitsigns-hl
autocmd!
autocmd ColorScheme nord highlight GitSignsAdd guifg=%s
autocmd ColorScheme nord highlight GitSignsChange guifg=%s
autocmd ColorScheme nord highlight GitSignsDelete guifg=%s
augroup END
	]],
	c.diff_add,
	c.diff_change,
	c.diff_delete
))
vim.cmd(string.format([[doautocmd gitsigns-hl ColorScheme %s]], vim.g.colors_name))
