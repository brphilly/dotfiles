local root_cache = {}

local function get_root(file_path)
	local possible_settings = vim.fs.find(".nvim", {path = file_path, upward = true, limit = math.huge, type = "directory"})
	for _, possible_path in ipairs(possible_settings) do
		local fd = io.open(possible_path.."/settings.json", "r")
		if fd then
			local root = vim.json.decode(fd:read("*a"))["root"]
			fd:close()
			if root then
				root = vim.fs.normalize(root)
				return root:sub(1, 1) == "/" and root or string.gsub(possible_path, "%.nvim$", "")..root
			end
			break
		end
	end

	local possible_roots = vim.fs.find(
		{".git"},
		{path = file_path, upward = true, limit = math.huge}
	)
	return vim.fs.dirname(possible_roots[#possible_roots] or file_path)
end

local function rooter(autocmd_params)
	if vim.bo[autocmd_params.buf].buftype ~= "" then return end

	local file_path = vim.fs.normalize(vim.api.nvim_buf_get_name(autocmd_params.buf))
	local root = root_cache[file_path]

	if root == nil then
		root = get_root(file_path)
		root_cache[file_path] = root
	end

	vim.fn.chdir(root)
end

local root_augroup = vim.api.nvim_create_augroup("Rooter", {})
vim.api.nvim_create_autocmd("BufEnter", {group = root_augroup, callback = rooter})
