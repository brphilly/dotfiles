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
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("cmp_nvim_lsp").default_capabilities()
	),
}
