vim.g.mapleader = " "

vim.opt.exrc = true

_G.P = function(...)
	vim.print(...)
end

Format_on_save = true
Enable_ai = true

require("options")
require("keymaps")
require("autocmds")
require("diagnostics")

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy.view.config").keys.close = "<c-c>"
require("lazy.view.config").keys.abort = "<c-a>"
require("lazy").setup("plugins", {
	install = { missing = false },
})

require("lsp")
