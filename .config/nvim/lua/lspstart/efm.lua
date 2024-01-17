local lspconfig = require("lspconfig.server_configurations.efm").default_config
return {
	name = "efm",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = {
		languages = {
			lua = { require("efmls-configs.formatters.stylua") },
		},
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
	},
	capabilities = require("lsp.capabilities"),
}
