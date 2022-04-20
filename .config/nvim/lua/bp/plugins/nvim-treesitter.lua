local parser_names = require("nvim-treesitter.parsers").available_parsers()
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
local install_parsers = vim.tbl_filter(function(p) return not parser_configs[p].experimental end, parser_names)
require("nvim-treesitter.configs").setup({
	ensure_installed = install_parsers,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "cpp" },
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "n",
			node_decremental = "N",
			scope_incremental = "<leader>n",
		},
	},
})
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
return install_parsers
