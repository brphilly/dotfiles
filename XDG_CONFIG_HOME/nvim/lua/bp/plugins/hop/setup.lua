vim.api.nvim_set_keymap("n", "<leader>hw", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>hw", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true })
vim.api.nvim_set_keymap("o", "<leader>hw", "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>hl", "<cmd>lua require'hop'.hint_lines()<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>hl", "<cmd>lua require'hop'.hint_lines()<cr>", { noremap = true })
vim.api.nvim_set_keymap("o", "<leader>hl", "<cmd>lua require'hop'.hint_lines()<cr>", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>h/", "<cmd>lua require'hop'.hint_patterns()<cr>", { noremap = true })
vim.api.nvim_set_keymap("x", "<leader>h/", "<cmd>lua require'hop'.hint_patterns()<cr>", { noremap = true })
vim.api.nvim_set_keymap("o", "<leader>h/", "<cmd>lua require'hop'.hint_patterns()<cr>", { noremap = true })

-- vim.api.nvim_set_keymap("n", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("x", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("o", "f", "<cmd>lua require'hop'.hint_char1()<cr>", {noremap = true})

-- vim.api.nvim_set_keymap("n", "s", "<cmd>lua require'hop'.hint_char2()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("x", "z", "<cmd>lua require'hop'.hint_char2()<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("o", "z", "<cmd>lua require'hop'.hint_char2()<cr>", {noremap = true})
