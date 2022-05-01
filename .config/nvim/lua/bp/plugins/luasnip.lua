vim.keymap.set("i", "<c-j>", require('luasnip').expand_or_jump)
vim.keymap.set("s", "<c-j>", require('luasnip').expand_or_jump)
vim.keymap.set("i", "<c-k>", function() require('luasnip').jump(-1) end)
vim.keymap.set("s", "<c-k>", function() require('luasnip').jump(-1) end)

-- Write any lua snippets before this
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
