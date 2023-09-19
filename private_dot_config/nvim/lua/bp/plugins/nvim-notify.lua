vim.notify = require("notify")
vim.keymap.set("n", "<leader>$", "<cmd>Notifications<cr>")
require("notify").setup({
	stages = "slide",
})
