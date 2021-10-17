require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["if"] = "@function.inner",
				["af"] = "@function.outer",
				["i["] = "@block.inner",
				["a["] = "@block.outer",
				["ia"] = "@parameter.inner",
				["aa"] = "@parameter.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = false, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]f"] = "@function.outer",
				["]]"] = "@block.outer",
				["]a"] = "@parameter.inner",
			},
			goto_next_end = {
				["]gf"] = "@function.outer",
				["]g]"] = "@block.outer",
				["]ga"] = "@parameter.inner",
			},
			goto_previous_start = {
				["[f"] = "@function.outer",
				["[["] = "@block.outer",
				["[a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["[gf"] = "@function.outer",
				["[g["] = "@block.outer",
				["[ga"] = "@parameter.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["]A"] = "@parameter.inner",
			},
			swap_previous = {
				["[A"] = "@parameter.inner",
			},
		},
		lsp_interop = {
			enable = true,
			border = "single",
			peek_definition_code = {
				["<leader>lp"] = "@block.outer",
			},
		},
	},
})
