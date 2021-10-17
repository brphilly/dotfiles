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

		bsk("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "textDocument/declaration")
		bsk("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "textDocument/definition")
		bsk("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "textDocument/typeDefinition")
		bsk("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "textDocument/implementation")
		bsk("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "textDocument/references")

		bsk("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "textDocument/hover")
		bsk("n", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "textDocument/signatureHelp")
		bsk("i", "<c-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "textDocument/signatureHelp")

		bsk("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", "textDocument/rename")
		bsk("n", "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "textDocument/codeAction")
		bsk("n", "<leader>lcl", "<cmd>lua vim.lsp.codelens.run()<CR>", "codeLens/resolve")
		bsk("n", "<leader>lh", '<cmd>lua require"bp.plugins.lsp".ref_hl()<cr>', "textDocument/documentHighlight")

		bsk("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", "textDocument/formatting")
		bsk("x", "<leader>lf", ":lua vim.lsp.buf.range_formatting()<CR>", "textDocument/rangeFormatting")

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>le", '<cmd>lua vim.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "[l", '<cmd>lua vim.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "]l", '<cmd>lua vim.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>', opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

		if client.supports_method("textDocument/codeLens") then
			vim.cmd([[
					augroup lspcodelens
					autocmd!
					autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
					augroup END
				]])
		end
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
local servers = { "sumneko_lua", "pyright", "clangd" } -- Remember to add these to packer lazy load and nvim-cmp
for _, server in ipairs(servers) do
	require("bp.plugins.lsp." .. server)
end

local M = {}
function M.ref_hl()
	vim.lsp.buf.document_highlight()
	vim.cmd([[
	augroup lsp_ref_hl
	autocmd! * <buffer>
	autocmd CursorMoved <buffer> lua require'bp.plugins.lsp'.clear_ref_hl()
	augroup END
	]])
end
function M.clear_ref_hl()
	vim.cmd([[autocmd! lsp_ref_hl * <buffer>]])
	vim.lsp.buf.clear_references()
end
return M
