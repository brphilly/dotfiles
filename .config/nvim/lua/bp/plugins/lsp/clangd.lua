local setup = require("bp.plugins.lsp.setup")
require("lspconfig").clangd.setup(vim.deepcopy(setup))
