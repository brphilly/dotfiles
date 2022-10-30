vim.keymap.set("n", "<leader>ffd", require("bp.plugins.telescope.maps").files_dir)
vim.keymap.set("n", "<leader>ff<leader>", require("bp.plugins.telescope.maps").files_cwd)
vim.keymap.set("n", "<leader>ffc", require("bp.plugins.telescope.maps").files_conf)
vim.keymap.set("n", "<leader>ffh", require("bp.plugins.telescope.maps").files_home)
-- vim.keymap.set("n", "<leader>ffo", function() require("telescope.builtin").oldfiles() end)

vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end)
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end)

vim.keymap.set("n", "<leader>fsd", require("bp.plugins.telescope.maps").grep_dir)
vim.keymap.set("n", "<leader>fs<leader>", require("bp.plugins.telescope.maps").grep_cwd)
vim.keymap.set("n", "<leader>fsc", require("bp.plugins.telescope.maps").grep_conf)
vim.keymap.set("n", "<leader>fsh", require("bp.plugins.telescope.maps").grep_home)
vim.keymap.set("n", "<leader>fsb", require("bp.plugins.telescope.maps").grep_bufs)
vim.keymap.set("n", "<leader>fs%", function() require("telescope.builtin").current_buffer_fuzzy_find() end)

vim.keymap.set("n", "<leader>ftd", require("bp.plugins.telescope.maps").grep_todo_dir)
vim.keymap.set("n", "<leader>ft<leader>", require("bp.plugins.telescope.maps").grep_todo_cwd)
vim.keymap.set("n", "<leader>ftc", require("bp.plugins.telescope.maps").grep_todo_conf)
vim.keymap.set("n", "<leader>fth", require("bp.plugins.telescope.maps").grep_todo_home)

vim.keymap.set("n", "<leader>fgc", function() require("telescope.builtin").git_commits() end)
vim.keymap.set("n", "<leader>fgb", function() require("telescope.builtin").git_branches() end)
