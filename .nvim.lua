-- set up lsp
vim.api.nvim_clear_autocmds({group = "lang_servs", event = "FileType", pattern = "lua"})
local lua_ls = vim.tbl_deep_extend("force", require("lspstart.lua_ls"), {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
				library = {vim.env.VIMRUNTIME},
			},
		},
	},
})
vim.api.nvim_create_autocmd("FileType", {group = "lang_servs", pattern = "lua", callback = function(args)
	if vim.bo[args.buf].buftype == "" then vim.lsp.start(lua_ls) end
end})
