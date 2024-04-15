local lsp_methods = require("lsp.methods")

local tsserver = require("lspstart.tsserver")
tsserver.on_attach = function(client, buf)
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
	pattern = { "typescript", "javascript" },
	callback = function(args)
		if
			vim.bo[args.buf].buftype == ""
			and not (vim.endswith(args.file, ".svelte.ts") or vim.endswith(args.file, ".svelte.js"))
		then
			vim.lsp.start(tsserver)
			vim.lsp.start(efm)
		end
	end,
})
