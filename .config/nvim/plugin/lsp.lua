vim.api.nvim_create_augroup("lsp", {})
local ft_path = vim.fn.stdpath("config") .. "/lua/ft"
for ft in vim.fs.dir(ft_path) do
	if vim.loop.fs_stat(table.concat({ ft_path, ft, "lsp", "default.lua" }, "/")) then
		require(string.format("ft.%s.lsp.default", ft))
	end
end
