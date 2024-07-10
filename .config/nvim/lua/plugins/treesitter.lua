return {
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local parser_names = require("nvim-treesitter.parsers").available_parsers()
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
			local install_parsers = vim.tbl_filter(function(p)
				return not parser_configs[p].experimental
			end, parser_names)
			table.insert(install_parsers, "htmldjango")
			require("nvim-treesitter.configs").setup({
				ensure_installed = install_parsers,
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
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
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
	},
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							["ia"] = "@parameter.inner",
							["aa"] = "@parameter.outer",
							["if"] = "@function.inner",
							["af"] = "@function.outer",
							["i["] = "@block.inner",
							["a["] = "@block.outer",
						},
					},
					move = {
						enable = true,
						set_jumps = false, -- whether to set jumps in the jumplist
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[["] = "@block.outer",
							["[a"] = "@parameter.inner",
						},
						goto_next_start = {
							["]f"] = "@function.outer",
							["]]"] = "@block.outer",
							["]a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[gf"] = "@function.outer",
							["[g["] = "@block.outer",
							["[ga"] = "@parameter.inner",
						},
						goto_next_end = {
							["]gf"] = "@function.outer",
							["]g]"] = "@block.outer",
							["]ga"] = "@parameter.inner",
						},
					},
					swap = {
						enable = true,
						swap_previous = {
							["[A"] = "@parameter.inner",
						},
						swap_next = {
							["]A"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		config = function()
			vim.keymap.set("n", "<bs>", "<cmd>TSContextToggle<cr>")
		end,
	},
	{
		url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
		lazy = false,
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})
			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
						and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
