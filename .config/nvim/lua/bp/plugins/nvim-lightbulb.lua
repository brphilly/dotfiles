vim.api.nvim_create_augroup("nvim-lightbulb-update", {})
vim.api.nvim_create_autocmd("CursorHold", {group = "nvim-lightbulb-update", callback = function()
	require("nvim-lightbulb").update_lightbulb({sign = {enabled = false}, status_text = {enabled = true}})
end})
