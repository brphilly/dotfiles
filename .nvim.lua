-- Override lua lsp
vim.api.nvim_clear_autocmds({group = "lsp", event = "FileType", pattern = "lua"})
require("ft.lua.lsp.nvim")
