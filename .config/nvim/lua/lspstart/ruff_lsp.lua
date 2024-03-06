local lspconfig = require("lspconfig.server_configurations.ruff_lsp").default_config
return {
	name = "ruff_lsp",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	init_options = lspconfig.init_options,
	capabilities = require("lsp.capabilities"),
	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { silent = true }),
	},
}
