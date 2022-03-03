require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
