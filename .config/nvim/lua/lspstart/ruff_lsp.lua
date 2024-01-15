local lspconfig = require("lspconfig.server_configurations.ruff_lsp").default_config
return {
	name = "ruff_lsp",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = lspconfig.settings,
	capabilities = vim.tbl_deep_extend(
		"force",
		vim.lsp.protocol.make_client_capabilities(),
		require("cmp_nvim_lsp").default_capabilities()
	),
	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { silent = true }),
	},
}
