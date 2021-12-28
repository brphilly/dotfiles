local cmd
if vim.fn.has("mac") == 1 then
	local sumneko_root_path = vim.env.HOME .. "/lang-servers/lua-language-server"
	cmd = { sumneko_root_path .. "/bin/macOS/lua-language-server", "-E", sumneko_root_path .. "/main.lua" }
elseif vim.fn.has("unix") == 1 then
	cmd = { "/usr/bin/lua-language-server" }
elseif vim.fn.has("win32") == 1 then
	cmd = {}
else
	print("Unsupported system for sumneko")
	return
end

-- set the path to the sumneko installation
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = cmd,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				-- TODO(brphilly): Investigate unlisted lsp buffers not appearing when using below. Search LSP code for vim.fn.bufadd
				-- library = vim.api.nvim_get_runtime_file("", true),
				library = vim.env.VIMRUNTIME, -- rename won't work using the above for some reason
				maxPreload = 2000,
				preloadFileSize = 150,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
