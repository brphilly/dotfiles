local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = function(client, bufnr)
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		-- Mappings
		local opts = { noremap = true, silent = true }
		local function bsk(mode, key, map, cap)
			if client.supports_method(cap) then
				vim.api.nvim_buf_set_keymap(bufnr, mode, key, map, opts)
			else
				vim.api.nvim_buf_set_keymap(
					bufnr,
					mode,
					key,
					string.format([[<cmd>lua vim.notify('%s is not supported by %s', 'error', {title='LSP Config'})<cr>]], cap, client.name),
					opts
				)
			end
		end

		bsk("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "textDocument/definition")
		bsk("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "textDocument/declaration")
		bsk("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "textDocument/typeDefinition")

		bsk("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", "textDocument/implementation")
		bsk("n", "<leader>lk", "<cmd>lua vim.lsp.buf.references()<CR>", "textDocument/references")
		bsk("n", "<leader>lds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "textDocument/documentSymbol")
		bsk("n", "<leader>lws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "workspace/symbol")
		bsk("n", "<leader>lt", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "textDocument/prepareCallHierarchy")
		bsk("n", "<leader>l]", "<cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "textDocument/prepareCallHierarchy")

		bsk("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "textDocument/hover")
		bsk("n", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "textDocument/signatureHelp")
		bsk("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "textDocument/signatureHelp")

		bsk("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", "textDocument/rename")
		if client.supports_method("textDocument/documentHighlight") then
			vim.cmd([[
					augroup lsp-hl-symbol
					autocmd! * <buffer>
					autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
					autocmd CursorMoved,InsertEnter,WinLeave <buffer> lua vim.lsp.buf.clear_references()
					augroup END
				]])
		end

		-- bsk("n", "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>", "textDocument/codeAction")
		-- bsk("x", "<leader>.", ":lua vim.lsp.buf.range_code_action()<CR>", "textDocument/codeAction")
		bsk("n", "<leader>.", "<cmd>CodeActionMenu<CR>", "textDocument/codeAction")
		bsk("x", "<leader>.", ":CodeActionMenu<CR>", "textDocument/codeAction")
		bsk("n", "<leader>lc", "<cmd>lua vim.lsp.codelens.run()<CR>", "workspace/executeCommand")
		if client.supports_method("textDocument/codeLens") then
			vim.cmd([[
					augroup lspcodelens
					autocmd! * <buffer>
					autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
					augroup END
				]])
		end

		bsk("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", "textDocument/formatting")
		bsk("x", "<leader>lf", ":lua vim.lsp.buf.range_formatting()<CR>", "textDocument/rangeFormatting")

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	end,

	flags = { debounce_text_changes = 200 },

	handlers = {
		["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
		["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
	},

	capabilities = capabilities,
	-- on_new_config = function(new_config, new_root_dir) -- run on new root dir, can use to change config
})

vim.fn.sign_define({
	{ name = "DiagnosticSignError", numhl = "DiagnosticSignError" },
	{ name = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" },
	{ name = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" },
	{ name = "DiagnosticSignHint", numhl = "DiagnosticSignHint" },
})

-- Use a loop to setup defined servers
local servers = { "sumneko_lua", "pyright", "clangd" } -- Remember to add these to packer lazy load
for _, server in ipairs(servers) do
	require("bp.plugins.lsp." .. server)
end
