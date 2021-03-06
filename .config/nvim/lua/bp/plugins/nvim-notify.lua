vim.notify = require("notify")
vim.keymap.set("n", "<leader>$", "<cmd>Notifications<cr>")
require("notify").setup({
	stages = "slide",
})

local c = require("nord.colours")
vim.api.nvim_create_augroup("notify-hl", {})
vim.api.nvim_create_autocmd("ColorScheme", {group = "notify-hl", pattern = "nord", callback = function()
	vim.api.nvim_set_hl(0, "NotifyERRORBorder", {fg = c.error, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyWARNBorder", {fg = c.warning, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyINFOBorder", {fg = c.info, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", {fg = c.danger, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyTRACEBorder", {fg = c.comment, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyERRORIcon", {fg = c.error, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyWARNIcon", {fg = c.warning, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyINFOIcon", {fg = c.info, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", {fg = c.danger, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyTRACEIcon", {fg = c.comment, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyERRORTitle", {fg = c.error, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyWARNTitle", {fg = c.warning, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyINFOTitle", {fg = c.info, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", {fg = c.danger, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyTRACETitle", {fg = c.comment, bg = c.bg_float})
	vim.api.nvim_set_hl(0, "NotifyLogTitle", {fg = c.title})
	vim.api.nvim_set_hl(0, "NotifyERRORBody", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "NotifyWARNBody", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "NotifyINFOBody", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "NotifyDEBUGBody", {link = "NormalFloat"})
	vim.api.nvim_set_hl(0, "NotifyTRACEBody", {link = "NormalFloat"})
end})
vim.api.nvim_exec_autocmds("ColorScheme", {group = "notify-hl", pattern = vim.g.colors_name})
