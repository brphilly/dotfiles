local lspconfig = require("lspconfig.server_configurations.tailwindcss").default_config
return {
	name = "tailwindcss",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	init_options = lspconfig.init_options,
	capabilities = require("lsp.capabilities"),
}
