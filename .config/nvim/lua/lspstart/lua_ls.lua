local lspconfig = require("lspconfig.server_configurations.lua_ls").default_config
return {
	name = "lua_ls",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	capabilities = require("lsp.capabilities"),
}
