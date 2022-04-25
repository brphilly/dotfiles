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
vim.api.nvim_create_augroup("gitsigns-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "gitsigns-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "GitSignsAdd", {fg = c.diff_add})
	vim.api.nvim_set_hl(0, "GitSignsChange", {fg = c.diff_change})
	vim.api.nvim_set_hl(0, "GitSignsDelete", {fg = c.diff_delete})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "gitsigns-hl", pattern = vim.g.colors_name})
