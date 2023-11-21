vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files({
	prompt_title = "Files: "..vim.fn.getcwd(),
	hidden = true,
}) end)
vim.keymap.set("n", "<leader>fF", require("telescope.builtin").buffers)
vim.api.nvim_create_user_command("FuzzyFindRuntime", function()
	require("telescope.builtin").find_files({
		search_dirs = {vim.env.VIMRUNTIME, vim.fn.stdpath("data")},
		prompt_title = "Files: Runtime",
	})
end, {desc = "Fuzzy find runtime files"})

vim.keymap.set("n", "<leader>fs", function() require("telescope.builtin").live_grep({
	prompt_title = "Grep: "..vim.fn.getcwd(),
	additional_args = {"--hidden"},
}) end)
vim.keymap.set("n", "<leader>fS", function() require("telescope.builtin").live_grep({
	grep_open_files = true,
	prompt_title = "Grep: Buffers",
}) end)
vim.keymap.set("n", "<leader>f/", require("telescope.builtin").current_buffer_fuzzy_find)
vim.api.nvim_create_user_command("FuzzyGrepRuntime", function()
	require("telescope.builtin").live_grep({
		search_dirs = {vim.env.VIMRUNTIME, vim.fn.stdpath("data")},
		prompt_title = "Grep: Runtime",
	})
end, {desc = "Grep runtime files"})

vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics)
vim.keymap.set("n", "<leader>fD", function() require("telescope.builtin").diagnostics({bufnr = 0}) end)
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").git_commits({git_command = {"git", "log", "--pretty=oneline", "--no-abbrev-commit", "--", "."}}) end)
vim.keymap.set("n", "<leader>fG", function() require("telescope.builtin").git_bcommits({git_command = {"git", "log", "--pretty=oneline", "--no-abbrev-commit", "--follow"}}) end)
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").commands)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>fH", require("telescope.builtin").man_pages)
vim.keymap.set("n", "<leader>fq", require("telescope.builtin").quickfixhistory)
vim.keymap.set("n", "<leader>F", require("telescope.builtin").resume)
