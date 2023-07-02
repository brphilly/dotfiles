if vim.bo.buftype ~= "" then return end

local file_path = vim.fs.normalize(vim.api.nvim_buf_get_name(0))

local local_settings_path, local_settings = require("bp.lsp").local_settings(file_path)

local possible_roots = vim.fs.find(
	{".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git"},
	{path = file_path, upward = true, limit = math.huge}
)
local root_dir = vim.fs.dirname(possible_roots[#possible_roots])

vim.lsp.start({
	name = "LuaLS",
	cmd = {"lua-language-server"},
	root_dir = local_settings_path or root_dir,
	workspace_folders = vim.tbl_get(local_settings, "folders") or (root_dir and {{uri = vim.uri_from_fname(root_dir), name = vim.fs.basename(root_dir)}}),
	capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities()),
	settings = {
		Lua = vim.tbl_deep_extend("force", {
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
			}, vim.tbl_get(local_settings, "Lua") or {}),
	}
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = 0})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = 0})
vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer = 0})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
vim.keymap.set("n", "gz", "<cmd>CodeActionMenu<CR>", {buffer = 0})
vim.keymap.set("x", "gz", ":CodeActionMenu<CR>", {buffer = 0})
vim.keymap.set("n", "gl", vim.lsp.codelens.run, {buffer = 0})
vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, {buffer = 0})
vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, {buffer = 0})
vim.api.nvim_buf_create_user_command(0, "LspWorkspaceFolderList", function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end, {})
local augrp = vim.api.nvim_create_augroup("lsp_sumneko", {clear = false})
vim.api.nvim_clear_autocmds({group = augrp, buffer = 0})
vim.api.nvim_create_autocmd("CursorHold", {group = augrp, buffer = 0, callback = function() vim.lsp.buf.document_highlight() end})
vim.api.nvim_create_autocmd({"CursorMoved", "InsertEnter", "WinLeave"}, {group = augrp, buffer = 0, callback = function() vim.lsp.buf.clear_references() end})
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI", "InsertLeave"}, {group = augrp, buffer = 0, callback = function() vim.lsp.codelens.refresh() end})
