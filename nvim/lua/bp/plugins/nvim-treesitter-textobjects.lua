-- TODO(brphilly): Keep an eye on updates to this, goto next node, next string etc
require("nvim-treesitter.configs").setup({
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["if"] = "@function.inner",
				["af"] = "@function.outer",
				["ic"] = "@class.inner",
				["ac"] = "@class.outer",
			},
		},
		move = {
			enable = true,
			set_jumps = false, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
				["]a"] = "@parameter.inner",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
				["]A"] = "@parameter.inner",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
				["[a"] = "@parameter.inner",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
				["[A"] = "@parameter.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>]a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>[a"] = "@parameter.inner",
			},
		},
		-- lsp_interop = {
		--   enable = true,
		--   peek_definition_code = {
		--     ["df"] = "@function.outer",
		--     ["dF"] = "@class.outer",
		--   },
		-- },
	},
})
