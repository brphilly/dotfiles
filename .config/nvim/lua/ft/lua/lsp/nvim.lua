local lsp_methods = require("lsp.methods")

local lua_ls_nvim = require("lspstart.lua_ls_nvim")
lua_ls_nvim.on_attach = function(client, buf)
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
	pattern = "lua",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			vim.lsp.start(lua_ls_nvim)
			vim.lsp.start(efm)
		end
	end,
})
