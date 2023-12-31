local pyright = require("lspstart.pyright")
local ruff = require("lspstart.ruff_lsp")
vim.api.nvim_create_autocmd("FileType", {group = "lang_servs", pattern = "python", callback = function(args)
	if vim.bo[args.buf].buftype == "" then
		vim.lsp.start(pyright)
		vim.lsp.start(ruff)
	end
end})
