local setup = require("bp.plugins.lsp.setup")
require("lspconfig").pyright.setup(vim.deepcopy(setup))
