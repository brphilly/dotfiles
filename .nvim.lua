-- Override lua lsp
local lsp_methods = require("lsp.methods")
require("lspconfig").lua_ls.setup({
	name = "lua_ls_nvim",
	on_attach = function(client, buf)
		for method, f in pairs(lsp_methods) do
			if method ~= "textDocument/formatting" then
				f(client, buf)
			end
		end
	end,
	on_new_config = function(config)
		config.settings = vim.tbl_deep_extend("force", config.settings, {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			},
		})
	end,
	capabilities = require("lsp.capabilities"),
})
