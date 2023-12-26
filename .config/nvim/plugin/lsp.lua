-- setup language servers
vim.api.nvim_create_augroup("lang_servs", {})
local function setup_lang_serv(ft, ls)
	local lsconf = require("lspstart."..ls)
	vim.api.nvim_create_autocmd("FileType", {group = "lang_servs", pattern = ft, callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then return end

		local workspace_folders = lsconf.workspace_folders or {{uri = vim.uri_from_fname(lsconf.root_dir)}}
		local buf_uri = vim.uri_from_bufnr(args.buf)
		for wf in ipairs(workspace_folders) do
			---@diagnostic disable: undefined-field
			if vim.startswith(buf_uri, wf.uri) then
				vim.lsp.start(lsconf)
				return
			end
		end
	end})
end

setup_lang_serv("lua", "lua_ls")
setup_lang_serv("python", "pyright")
setup_lang_serv("rust", "rust_analyzer")


-- setup keymaps/autocmds
vim.api.nvim_create_augroup("lsp", {})
vim.api.nvim_create_augroup("lsp-documentHighlight", {})
vim.api.nvim_create_augroup("lsp-codeLens", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "lsp",
	callback = function(args)
		local buf = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then return end

		if client.supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = buf})
		end
		if client.supports_method("textDocument/declaration") then
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = buf})
		end
		if client.supports_method("textDocument/typeDefinition") then
			vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = buf})
		end
		if client.supports_method("textDocument/rename") then
			vim.keymap.set("n", "gr", vim.lsp.buf.rename, {buffer = buf})
		end
		if client.supports_method("textDocument/codeLens") and client.supports_method("workspace/executeCommand") then
			vim.keymap.set("n", "gl", vim.lsp.codelens.run, {buffer = buf})
		end
		if client.supports_method("textDocument/hover") then
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = buf})
		end
		if client.supports_method("textDocument/signatureHelp") then
			vim.keymap.set({"n", "i"}, "<c-s>", vim.lsp.buf.signature_help, {buffer = buf})
		end

		if client.supports_method("textDocument/documentHighlight") then
			vim.api.nvim_clear_autocmds({group = "lsp-documentHighlight", buffer = args.buf})
			vim.api.nvim_create_autocmd("CursorHold",
				{group = "lsp-documentHighlight", buffer = buf, callback = function()
					vim.lsp.buf.document_highlight()
				end}
			)
			vim.api.nvim_create_autocmd({"CursorMoved", "InsertEnter", "WinLeave"},
				{group = "lsp-documentHighlight", buffer = buf, callback = function()
					vim.lsp.buf.clear_references()
				end}
			)
		end
		if client.supports_method("textDocument/codeLens") and client.supports_method("codeLens/resolve") then
			vim.api.nvim_clear_autocmds({group = "lsp-codeLens", buffer = args.buf})
			vim.api.nvim_create_autocmd({"CursorHold", "InsertLeave"},
				{group = "lsp-codeLens", buffer = buf, callback = function()
					vim.lsp.codelens.refresh()
				end}
			)
		end
	end,
})
