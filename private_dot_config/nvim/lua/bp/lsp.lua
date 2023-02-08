local function get_settings_json(fd, settings_path)
	local settings_str = fd:read("*a")
	local settings_json = vim.json.decode(settings_str)

	-- convert workspace folder paths to URIs
	if settings_json["folders"] then
		settings_json["folders"] = vim.tbl_map(function(folder)
			local path = vim.fs.normalize(folder["path"])
			if path:sub(1, 1) ~= "/" then path = string.gsub(settings_path, "%.nvim$", "")..path end
			return {uri = vim.uri_from_fname(path), name = folder["name"]}
			end, settings_json["folders"])
	end

	return settings_json
end

local M = {}

function M.local_settings(file_path)
	local possible_settings = vim.fs.find(".nvim", {path = file_path, upward = true, limit = math.huge, type = "directory"})

	local fd, settings_path, settings_json
	for _, possible_path in ipairs(possible_settings) do
		fd = io.open(possible_path.."/settings.json", "r")
		if fd then
			settings_path = possible_path
			settings_json = get_settings_json(fd, settings_path)
			fd:close()
			break
		end
	end

	return settings_path, settings_json
end

return M
