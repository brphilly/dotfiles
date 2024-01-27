return {
	{
		url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
		lazy = true,
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		url = "https://github.com/nvim-telescope/telescope.nvim",
		lazy = true,
		dependencies = { "telescope-fzf-native.nvim" },
		init = function()
			vim.keymap.set("n", "<c-p>", function()
				require("telescope.builtin").find_files({
					prompt_title = "Files: " .. vim.fn.getcwd(),
					hidden = true,
				})
			end)
			vim.keymap.set("n", "<leader>fb", function()
				require("telescope.builtin").buffers()
			end)
			vim.api.nvim_create_user_command("FuzzyFindRuntime", function()
				require("telescope.builtin").find_files({
					search_dirs = { vim.env.VIMRUNTIME, vim.fn.stdpath("data") },
					prompt_title = "Files: Runtime",
				})
			end, { desc = "Fuzzy find runtime files" })

			vim.keymap.set("n", "<leader>fs", function()
				require("telescope.builtin").live_grep({
					prompt_title = "Grep: " .. vim.fn.getcwd(),
					additional_args = { "--hidden" },
				})
			end)
			vim.keymap.set("n", "<leader>fS", function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Grep: Buffers",
				})
			end)
			vim.keymap.set("n", "<leader>f/", function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end)
			vim.api.nvim_create_user_command("FuzzyGrepRuntime", function()
				require("telescope.builtin").live_grep({
					search_dirs = { vim.env.VIMRUNTIME, vim.fn.stdpath("data") },
					prompt_title = "Grep: Runtime",
				})
			end, { desc = "Grep runtime files" })

			vim.keymap.set("n", "<leader>fd", function()
				require("telescope.builtin").diagnostics()
			end)
			vim.keymap.set("n", "<leader>fD", function()
				require("telescope.builtin").diagnostics({ bufnr = 0 })
			end)
			vim.keymap.set("n", "<leader>fg", function()
				require("telescope.builtin").git_commits({
					git_command = { "git", "log", "--pretty=oneline", "--no-abbrev-commit", "--", "." },
				})
			end)
			vim.keymap.set("n", "<leader>fG", function()
				require("telescope.builtin").git_bcommits({
					git_command = { "git", "log", "--pretty=oneline", "--no-abbrev-commit", "--follow" },
				})
			end)
			vim.keymap.set("n", "<leader>fc", function()
				require("telescope.builtin").commands()
			end)
			vim.keymap.set("n", "<leader>fh", function()
				require("telescope.builtin").help_tags()
			end)
			vim.keymap.set("n", "<leader>fH", function()
				require("telescope.builtin").man_pages()
			end)
			vim.keymap.set("n", "<leader>fq", function()
				require("telescope.builtin").quickfixhistory()
			end)
			vim.keymap.set("n", "<leader>F", function()
				require("telescope.builtin").resume()
			end)
		end,
		config = function()
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
		end,
	},
}
