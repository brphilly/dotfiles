local lsp_methods = require("lsp.methods")

local jsonls = require("lspstart.jsonls")
jsonls.on_attach = function(client, buf)
	for method, f in pairs(lsp_methods) do
		if method ~= "textDocument/formatting" then
			f(client, buf)
		end
	end
end

local efm = require("lspstart.efm")
efm.on_attach = function(client, buf)
	lsp_methods["textDocument/formatting"](client, buf)
end

vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = { "json", "jsonc" },
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			vim.lsp.start(jsonls)
			vim.lsp.start(efm)
		end
	end,
})
