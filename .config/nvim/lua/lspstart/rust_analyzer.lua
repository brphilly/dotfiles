local lspconfig = require("lspconfig.server_configurations.rust_analyzer").default_config
return {
	name = "rust_analyzer",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	init_options = lspconfig.init_options,
	capabilities = require("lsp.capabilities"),
}
