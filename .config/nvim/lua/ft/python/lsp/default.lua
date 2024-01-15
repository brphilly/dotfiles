local lsp_methods = require("lsp_methods")

local pyright = require("lspstart.pyright")
local skip = { ["textDocument/formatting"] = true, ["textDocument/codeLens"] = true }
pyright.on_attach = function(client, buf)
	for method, f in pairs(lsp_methods) do
		if not skip[method] then
			f(client, buf)
		end
	end
end

local ruff = require("lspstart.ruff_lsp")
ruff.on_attach = function(client, buf)
	lsp_methods["textDocument/formatting"](client, buf)
end

vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = "python",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			vim.lsp.start(pyright)
			vim.lsp.start(ruff)
		end
	end,
})
