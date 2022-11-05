local M = {
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = bufnr})
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = bufnr})
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = bufnr})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr})
		vim.keymap.set("n", "<c-s>", vim.lsp.buf.signature_help, {buffer = bufnr})
		vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help, {buffer = bufnr})
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {buffer = bufnr})
		-- vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, {buffer = bufnr})
		-- vim.keymap.set("x", "<leader>lc", ":lua vim.lsp.buf.range_code_action()<cr>", {buffer = bufnr})
		vim.keymap.set("n", "<leader>lc", "<cmd>CodeActionMenu<CR>", {buffer = bufnr})
		vim.keymap.set("x", "<leader>lc", ":CodeActionMenu<CR>", {buffer = bufnr})
		vim.keymap.set("n", "<leader>ll", vim.lsp.codelens.run, {buffer = bufnr})
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {buffer = bufnr})
		vim.keymap.set("x", "<leader>lf", vim.lsp.buf.format, {buffer = bufnr})

		vim.api.nvim_buf_create_user_command(bufnr, "LspImplementations", function(_)
			vim.lsp.buf.implementation()
		end, {})
		vim.api.nvim_buf_create_user_command(bufnr, "LspReferences", function(_)
			vim.lsp.buf.references()
		end, {})
		vim.api.nvim_buf_create_user_command(bufnr, "LspFunctionCalledBy", function(_)
			vim.lsp.buf.incoming_calls()
		end, {})
		vim.api.nvim_buf_create_user_command(bufnr, "LspFunctionCalls", function(_)
			vim.lsp.buf.outgoing_calls()
		end, {})

		vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceFolderAdd", function(t)
			local folder
			if t.args == "" then folder = nil else folder = t.args end
			vim.lsp.buf.add_workspace_folder(folder)
		end, {nargs = "?"})
		vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceFolderRemove", function(t)
			local folder
			if t.args == "" then folder = nil else folder = t.args end
			vim.lsp.buf.add_workspace_folder(folder)
		end, {nargs = "?"})
		vim.api.nvim_buf_create_user_command(bufnr, "LspWorkspaceFolderList", function(_)
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, {})

		if client.supports_method("textDocument/documentHighlight") then
			vim.api.nvim_create_augroup("lsp-hl-symbol", {clear = false})
			vim.api.nvim_clear_autocmds({group = "lsp-hl-symbol", buffer = bufnr})
			vim.api.nvim_create_autocmd("CursorHold", {group = "lsp-hl-symbol", buffer = bufnr, callback = vim.lsp.buf.document_highlight})
			vim.api.nvim_create_autocmd({"CursorMoved", "InsertEnter", "WinLeave"},
				{group = "lsp-hl-symbol", buffer = bufnr, callback = vim.lsp.buf.clear_references})
		end

		if client.supports_method("textDocument/codeLens") then
			vim.api.nvim_create_augroup("lsp-codelens", {clear = false})
			vim.api.nvim_clear_autocmds({group = "lsp-codelens", buffer = bufnr})
			vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI", "InsertLeave"},
				{group = "lsp-codelens", buffer = bufnr, callback = vim.lsp.codelens.refresh})
		end
	end,

	flags = { debounce_text_changes = 200 },

	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
	},

	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	-- on_new_config = function(new_config, new_root_dir) -- run on new root dir, can use to change config
}

return M
