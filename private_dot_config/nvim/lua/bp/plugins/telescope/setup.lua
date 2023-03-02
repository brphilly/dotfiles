vim.keymap.set("n", "<leader>ffd", function() require("telescope.builtin").find_files({
	prompt_title = "Files: "..vim.fn.getcwd(),
}) end)
vim.keymap.set("n", "<leader>ffc", function() require("telescope.builtin").find_files({
	cwd = "~/.local/share/chezmoi",
	prompt_title = "Files: Config",
	hidden = true,
}) end)
vim.keymap.set("n", "<leader>ffb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>ffB", require("telescope.builtin").oldfiles)
vim.api.nvim_create_user_command("FuzzyFindRuntime", function()
	require("telescope.builtin").find_files({
		search_dirs = {vim.env.VIMRUNTIME, vim.fn.stdpath("data")},
		prompt_title = "Files: Runtime",
	})
end, {desc = "Fuzzy find runtime files"})

vim.keymap.set("n", "<leader>fsd", function() require("telescope.builtin").live_grep({
	prompt_title = "Grep: "..vim.fn.getcwd(),
}) end)
vim.keymap.set("n", "<leader>fsc", function() require("telescope.builtin").live_grep({
	cwd = "~/.local/share/chezmoi",
	prompt_title = "Grep: Config",
	additional_args = {"--hidden"},
}) end)
vim.keymap.set("n", "<leader>fsb", function() require("telescope.builtin").live_grep({
	grep_open_files = true,
	prompt_title = "Grep: Buffers",
}) end)
vim.keymap.set("n", "<leader>fsB", require("telescope.builtin").current_buffer_fuzzy_find)
vim.api.nvim_create_user_command("FuzzyGrepRuntime", function()
	require("telescope.builtin").live_grep({
		search_dirs = {vim.env.VIMRUNTIME, vim.fn.stdpath("data")},
		prompt_title = "Grep: Runtime",
	})
end, {desc = "Grep runtime files"})

vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics)
vim.keymap.set("n", "<leader>fD", function() require("telescope.builtin").diagnostics({bufnr = 0}) end)
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").commands)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>fH", require("telescope.builtin").man_pages)
vim.keymap.set("n", "<leader>fq", require("telescope.builtin").quickfixhistory)
vim.keymap.set("n", "<leader>F", require("telescope.builtin").resume)

vim.keymap.set("n", "<leader>fgc", function() require("telescope.builtin").git_commits({git_command = {"git", "log", "--pretty=oneline", "--no-abbrev-commit", "--", "."}}) end)
vim.keymap.set("n", "<leader>fgC", function() require("telescope.builtin").git_bcommits({git_command = {"git", "log", "--pretty=oneline", "--no-abbrev-commit", "--follow"}}) end)
vim.keymap.set("n", "<leader>fgb", require("telescope.builtin").git_branches)
