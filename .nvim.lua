-- Override lua lsp
require("lspconfig").lua_ls.setup({
	name = "lua_ls_nvim",
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
