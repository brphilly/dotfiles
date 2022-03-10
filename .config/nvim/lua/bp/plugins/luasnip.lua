vim.api.nvim_set_keymap("i", "<c-l>", "<cmd>lua require('luasnip').expand_or_jump()<cr>", { noremap = true })
vim.api.nvim_set_keymap("s", "<c-l>", "<cmd>lua require('luasnip').expand_or_jump()<cr>", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true })
vim.api.nvim_set_keymap("s", "<c-h>", "<cmd>lua require('luasnip').jump(-1)<cr>", { noremap = true })

-- Write any lua snippets before this
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
