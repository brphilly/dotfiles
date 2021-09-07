local lspconfig = require'lspconfig'
lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config,
	{
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			-- Mappings
			local opts = { noremap=true, silent=true }
			local function bsk(mode, key, map, cap)
				if cap == nil or client.resolved_capabilities[cap] then
					vim.api.nvim_buf_set_keymap(bufnr, mode, key, map, opts)
				else
					vim.api.nvim_buf_set_keymap(bufnr, mode, key, '<cmd>echo "Not supported"<cr>', opts)
				end
			end

			bsk("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", 'declaration')
			bsk('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', 'goto_definition')
			bsk('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type_definition')
			bsk('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation')
			bsk('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', 'find_references')

			bsk('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', 'hover')
			bsk('n', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature_help')
			bsk('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'signature_help')

			bsk('n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
			bsk('n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
			bsk('n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')

			bsk('n', '<leader>lrn', '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename')
			bsk('n', '<leader>lca', '<cmd>lua vim.lsp.buf.code_action()<CR>', 'code_action')
			bsk('n', '<leader>lcl', '<cmd>lua vim.lsp.codelens.run()<CR>', 'execute_command')
			bsk('n', '<leader>lh', '<cmd>lua require"bp.plugins.lsp".ref_hl()<cr>', 'document_highlight')

			bsk('n', '<leader>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>')
			bsk('n', '[l', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = "single"}})<CR>')
			bsk('n', ']l', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = "single"}})<CR>')
			bsk('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

			bsk("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", 'document_formatting')
			bsk("x", "<leader>lf", ":lua vim.lsp.buf.range_formatting()<CR>", 'document_range_formatting')

			if client.resolved_capabilities['code_lens'] then
				vim.cmd [[
					augroup lspcodelens
					autocmd!
					autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()
					augroup END
				]]
			end
		end,

		flags = {debounce_text_changes = 200},

		handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single", silent = true}),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single", silent = true}),
			["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {update_in_insert = true, signs = false, severity_sort = true}
			),
		},
		-- on_new_config = function(new_config, new_root_dir) -- run on new root dir, can use to change config
	}
)

local ok,capabilities = pcall(require, 'bp.plugins.cmp-nvim-lsp')
if ok then
	lspconfig.util.default_config.capabilities = capabilities
end

-- Use a loop to setup defined servers
local servers = {'sumneko_lua', 'pyright', 'clangd'} -- Remember to add these to packer lazy load and nvim-cmp
for _, server in ipairs(servers) do
	require('bp.plugins.lsp.'..server)
end

local M = {}
function M.ref_hl()
	vim.lsp.buf.document_highlight()
	vim.cmd [[
	augroup lsp_ref_hl
	autocmd! * <buffer>
	autocmd CursorMoved <buffer> lua require'bp.plugins.lsp'.clear_ref_hl()
	augroup END
	]]
end
function M.clear_ref_hl()
	vim.cmd [[autocmd! lsp_ref_hl * <buffer>]]
	vim.lsp.buf.clear_references()
end
return M
