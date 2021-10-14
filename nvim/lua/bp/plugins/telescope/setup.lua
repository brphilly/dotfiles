local maps = '<cmd>lua require"bp.plugins.telescope.maps".'
local builtin = '<cmd>lua require"telescope.builtin".'
local skeymap = vim.api.nvim_set_keymap

skeymap("n", "<leader>ffd", maps .. "files_dir()<cr>", { noremap = true })
skeymap("n", "<leader>ffw", maps .. "files_cwd()<cr>", { noremap = true })
skeymap("n", "<leader>ffc", maps .. "files_conf()<cr>", { noremap = true })
skeymap("n", "<leader>ffh", maps .. "files_home()<cr>", { noremap = true })
-- skeymap("n", "<leader>ffo", builtin .. "oldfiles()<cr>", { noremap = true })

skeymap("n", "<leader>fb", builtin .. "buffers()<cr>", { noremap = true })
skeymap("n", "<leader>fh", builtin .. "help_tags()<cr>", { noremap = true })

skeymap("n", "<leader>fsd", maps .. "grep_dir()<cr>", { noremap = true })
skeymap("n", "<leader>fsw", maps .. "grep_cwd()<cr>", { noremap = true })
skeymap("n", "<leader>fsc", maps .. "grep_conf()<cr>", { noremap = true })
skeymap("n", "<leader>fsh", maps .. "grep_home()<cr>", { noremap = true })
skeymap("n", "<leader>fsb", maps .. "grep_bufs()<cr>", { noremap = true })
skeymap("n", "<leader>fs%", builtin .. "current_buffer_fuzzy_find()<cr>", { noremap = true })

skeymap("n", "<leader>ftd", maps .. "grep_todo_dir()<cr>", { noremap = true })
skeymap("n", "<leader>ftw", maps .. "grep_todo_cwd()<cr>", { noremap = true })
skeymap("n", "<leader>ftc", maps .. "grep_todo_conf()<cr>", { noremap = true })
skeymap("n", "<leader>fth", maps .. "grep_todo_home()<cr>", { noremap = true })

skeymap("n", "<leader>f-d", maps .. "browse_dir()<cr>", { noremap = true })
skeymap("n", "<leader>f-w", maps .. "browse_cwd()<cr>", { noremap = true })
skeymap("n", "<leader>f-c", maps .. "browse_conf()<cr>", { noremap = true })
skeymap("n", "<leader>f-h", maps .. "browse_home()<cr>", { noremap = true })

skeymap("n", "<leader>fgc", builtin .. "git_commits()<cr>", { noremap = true })
skeymap("n", "<leader>fgb", builtin .. "git_branches()<cr>", { noremap = true })
