require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = {},  -- list of language that will be disabled
		custom_captures = {
			-- ["foo.bar"] = "Identifier", -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
		},
	},
	indent = {
		enable = true,
		disable = {"cpp"},
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<leader>v",
			node_incremental = "<tab>",
			node_decremental = "<s-tab>",
			scope_incremental = "<leader><tab>",
		},
	},
}
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
