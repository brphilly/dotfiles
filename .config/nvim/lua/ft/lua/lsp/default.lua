local lsp_methods = require("lsp.methods")

local on_attach = function(client, buf)
	for method, f in pairs(lsp_methods) do
		if method ~= "textDocument/formatting" then
			f(client, buf)
		end
	end
end

local lua_ls = require("lspstart.lua_ls")
lua_ls.on_attach = on_attach

local lua_ls_nvim = require("lspstart.lua_ls_nvim")
lua_ls_nvim.on_attach = on_attach

local efm = require("lspstart.efm")
efm.on_attach = function(client, buf)
	lsp_methods["textDocument/formatting"](client, buf)
end

local proj_local_path = vim.fn.getcwd() .. "/.nvim.lua"
vim.api.nvim_create_autocmd("FileType", {
	group = "lsp",
	pattern = "lua",
	callback = function(args)
		if vim.bo[args.buf].buftype == "" then
			if vim.fn.expand("<afile>:p") ~= proj_local_path then
				vim.lsp.start(lua_ls)
			else
				vim.lsp.start(lua_ls_nvim)
			end
			vim.lsp.start(efm)
		end
	end,
})
