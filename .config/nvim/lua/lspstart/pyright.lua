local lspconfig = require("lspconfig.server_configurations.pyright").default_config
local cwd = vim.fn.getcwd()
local venv_python_path = cwd.."/.venv/bin/python"
local settings = lspconfig.settings
if vim.uv.fs_stat(venv_python_path) then
	settings = vim.tbl_deep_extend("force", settings or {}, { python = { pythonPath = venv_python_path } })
end
return {
	name = "pyright",
	root_dir = cwd,
	cmd = lspconfig.cmd,
	settings = settings,
	capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
}
