local rust_analyzer = require("lspstart.rust_analyzer")
vim.api.nvim_create_autocmd("FileType", {group = "lang_servs", pattern = "rust", callback = function(args)
	if vim.bo[args.buf].buftype == "" then vim.lsp.start(rust_analyzer) end
end})
