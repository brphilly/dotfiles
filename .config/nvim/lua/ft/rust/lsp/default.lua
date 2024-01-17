local lsp_methods = require("lsp.methods")

local rust_analyzer = require("lspstart.rust_analyzer")
rust_analyzer.on_attach = function(client, buf)
	for _, f in pairs(lsp_methods) do
		f(client, buf)
	end
end

vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = "rust",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			vim.lsp.start(rust_analyzer)
		end
	end,
})
