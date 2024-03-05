Bookmarks = {}
local git_head = ""
vim.api.nvim_set_hl(0, "bookmarks", { fg = "#7fbbb3" })
local ns = vim.api.nvim_create_namespace("bookmarks")
local aug = vim.api.nvim_create_augroup("bookmarks", {})
local bookmarks_dir = vim.fn.stdpath("state") .. "/bookmarks/" .. vim.fs.normalize(vim.fn.getcwd()):gsub("/", "%%")
vim.fn.mkdir(bookmarks_dir, "p", tonumber("700", 8))

local function read_bookmarks_file()
	local bookmarks_file = bookmarks_dir .. string.format("/%s.json", git_head)

	local file = io.open(bookmarks_file)
	if file ~= nil then
		local json = file:read("*a")
		Bookmarks = vim.json.decode(json)
	else
		Bookmarks = {}
	end
end
local function place_bookmark_extmarks(buf)
	vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
	local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
	local extmrks = vim.tbl_keys(Bookmarks[fname] or {})
	for extmrk in vim.iter(extmrks) do
		local row, col = table.unpack(vim.iter(vim.gsplit(extmrk, ",", { plain = true })):map(tonumber):totable())
		vim.api.nvim_buf_set_extmark(buf, ns, row, col, {
			sign_text = "⚑",
			sign_hl_group = "bookmarks",
			strict = false,
		})
	end
end

-- watch git HEAD for changes
local watch = vim.uv.new_fs_event()
local function watch_git_head()
	vim.system(
		{ "git", "rev-parse", "--absolute-git-dir", "--abbrev-ref", "HEAD" },
		{ text = true },
		vim.schedule_wrap(function(obj)
			local git_dir, head = table.unpack(vim.split(obj.stdout, "\n", { plain = true }))
			if head ~= git_head then
				git_head = head
				read_bookmarks_file()
				local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(function(buf)
					return vim.api.nvim_get_option_value("buftype", { buf = buf }) == ""
						and vim.api.nvim_buf_is_loaded(buf)
				end)
				for buf in bufs do
					place_bookmark_extmarks(buf)
				end
			end
			watch:start(git_dir .. "/HEAD", {}, function()
				watch:stop()
				watch_git_head()
			end)
		end)
	)
end
watch_git_head()

vim.api.nvim_create_autocmd("BufRead", {
	group = aug,
	callback = function(args)
		place_bookmark_extmarks(args.buf)
	end,
})

local function write_bookmarks_file()
	local bookmarks_file = bookmarks_dir .. string.format("/%s.json", git_head)
	local file = io.open(bookmarks_file, "w")
	if file ~= nil then
		file:write(vim.json.encode(Bookmarks))
		file:close()
	end
end

vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	group = aug,
	callback = function(args)
		local bkmrk_locs = {}
		for extmrk in vim.iter(vim.api.nvim_buf_get_extmarks(args.buf, ns, 0, -1, {})) do
			local _, row, col = table.unpack(extmrk)
			bkmrk_locs[table.concat({ row, col }, ",")] = true
		end

		local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(args.buf), ":.")
		if vim.tbl_isempty(bkmrk_locs) then
			Bookmarks[fname] = nil
		else
			Bookmarks[fname] = bkmrk_locs
		end
		write_bookmarks_file()
	end,
})

local function toggle_bookmark()
	local fname = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	local row, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	local extmrks = vim.api.nvim_buf_get_extmarks(0, ns, { row, 0 }, { row, -1 }, {})
	if vim.tbl_count(extmrks) > 0 then
		for extmrk in vim.iter(extmrks) do
			local extmrk_id, row, col = table.unpack(extmrk)
			vim.api.nvim_buf_del_extmark(0, ns, extmrk_id)

			if Bookmarks[fname] ~= nil then
				Bookmarks[fname][table.concat({ row, col }, ",")] = nil
				if vim.tbl_isempty(Bookmarks[fname]) then
					Bookmarks[fname] = nil
				end
			end
		end
	else
		if Bookmarks[fname] == nil then
			Bookmarks[fname] = { [table.concat({ row, col }, ",")] = true }
		else
			Bookmarks[fname][table.concat({ row, col }, ",")] = true
		end
		vim.api.nvim_buf_set_extmark(0, ns, row, col, {
			sign_text = "⚑",
			sign_hl_group = "bookmarks",
		})
	end
	write_bookmarks_file()
end
vim.keymap.set("n", "<leader>m", toggle_bookmark)
