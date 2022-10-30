require("pounce").setup({
  multi_window = false,
})

local c = require("nord.colours")
vim.api.nvim_create_augroup("pounce-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "pounce-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "PounceMatch", {fg = c.comment, bg = c.search})
	vim.api.nvim_set_hl(0, "PounceGap", {fg = c.fg_fade, bg = c.search})
	vim.api.nvim_set_hl(0, "PounceAccept", {fg = c.bg, bg = c.attention_alt})
	vim.api.nvim_set_hl(0, "PounceAcceptBest", {fg = c.bg, bg = c.attention})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "pounce-hl", pattern = vim.g.colors_name})
