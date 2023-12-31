local lua_ls = require("lspstart.lua_ls")
vim.api.nvim_create_autocmd("FileType", {group = "lang_servs", pattern = "lua", callback = function(args)
	if vim.bo[args.buf].buftype == "" then vim.lsp.start(lua_ls) end
end})
