local lspconfig = require("lspconfig.server_configurations.efm").default_config
return {
	name = "efm",
	root_dir = vim.fn.getcwd(),
	cmd = lspconfig.cmd,
	settings = {
		languages = {
			lua = { require("efmls-configs.formatters.stylua") },
			html = { require("efmls-configs.formatters.prettier") },
			css = { require("efmls-configs.formatters.prettier") },
			json = { require("efmls-configs.formatters.prettier") },
			jsonc = { require("efmls-configs.formatters.prettier") },
			typescript = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
			javascript = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
			svelte = { require("efmls-configs.formatters.prettier"), require("efmls-configs.linters.eslint") },
		},
	},
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		documentSymbol = true,
		codeAction = true,
		completion = true,
	},
	capabilities = require("lsp.capabilities"),
}
