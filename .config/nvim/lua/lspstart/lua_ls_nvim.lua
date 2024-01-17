local lspconfig = require("lspconfig.server_configurations.lua_ls").default_config
return {
	name = "lua_ls_nvim",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = vim.tbl_deep_extend("force", lspconfig.settings or {}, {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
		},
	}),
	capabilities = require("lsp.capabilities"),
}
