vim.api.nvim_set_keymap("i", "<c-]>]", "<cmd>lua require('luasnip').expand_or_jump()<cr>", { noremap = true })
vim.api.nvim_set_keymap("s", "<c-]>]", "<cmd>lua require('luasnip').expand_or_jump()<cr>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-]>[", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true })
vim.api.nvim_set_keymap("s", "<c-]>[", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true })

-- Write any lua snippets before this
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })