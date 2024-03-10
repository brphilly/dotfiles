local lspconfig = require("lspconfig.server_configurations.tsserver").default_config
return {
	name = "tsserver",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	init_options = lspconfig.init_options,
	capabilities = require("lsp.capabilities"),
}
