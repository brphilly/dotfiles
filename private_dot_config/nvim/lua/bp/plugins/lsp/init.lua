-- Use a loop to setup defined servers
local servers = { "sumneko_lua", "pyright", "clangd" } -- Remember to add these to packer lazy load
for _, server in ipairs(servers) do
	require("bp.plugins.lsp." .. server)
end
