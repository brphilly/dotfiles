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

-- Workaround for https://github.com/neovim/neovim/issues/30985
for _, method in ipairs({ "textDocument/diagnostic", "workspace/diagnostic" }) do
	local default_diagnostic_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, result, context, config)
		if err ~= nil and err.code == -32802 then
			return
		end
		return default_diagnostic_handler(err, result, context, config)
	end
end

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
require("lazy.view.config").keys.close = "<c-c>"
require("lazy.view.config").keys.abort = "<c-a>"
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})

require("lsp")
