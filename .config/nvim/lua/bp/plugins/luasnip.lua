vim.keymap.set("i", "<c-l>", require('luasnip').expand_or_jump)
vim.keymap.set("s", "<c-l>", require('luasnip').expand_or_jump)
vim.keymap.set("i", "<c-h>", function() require('luasnip').jump(-1) end)
vim.keymap.set("s", "<c-h>", function() require('luasnip').jump(-1) end)

-- Write any lua snippets before this
require("luasnip.loaders.from_vscode").load({ paths = { "./snippets" } })
