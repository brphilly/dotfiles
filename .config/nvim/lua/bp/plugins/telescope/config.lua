local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%.DS_Store", "%.git/.*" },
		layout_strategy = "bottom_pane",
		path_display = { "smart" },
		wrap_results = true,
		sorting_strategy = "ascending",
    borderchars = {
      prompt = { "─", "", "─", "", "─", "─", " ", " " },
      results = { "─", "", "", "", "", "", "", "" },
      preview = { "─", "", "", "│", "╭", "─", "", "│" },
    },
		dynamic_preview_title = true,
		results_title = false,
		mappings = {
			i = {
				["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
	},
	pickers = {
		buffers = {
			sort_mru = true,
			mappings = {
				i = {
					["<c-w>"] = actions.delete_buffer,
				},
			},
		},
		help_tags = {
			mappings = {
				i = {
					["<cr>"] = actions.select_vertical,
				},
			},
		},
	},
})
