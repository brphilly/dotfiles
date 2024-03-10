local format_buf_clients = setmetatable({}, {
	__index = function(tbl, key)
		local default = {}
		rawset(tbl, key, default)
		return default
	end,
})

local hover_buf_clients = setmetatable({}, {
	__index = function(tbl, key)
		local default = {}
		rawset(tbl, key, default)
		return default
	end,
})

function _G.lsp_format_expr(buf)
	if vim.list_contains({ "i", "R", "ic", "ix" }, vim.fn.mode()) then
		-- `formatexpr` is also called when exceeding `textwidth` in insert mode
		-- fall back to internal formatting
		return 1
	end

	local start_lnum = vim.v.lnum
	local end_lnum = start_lnum + vim.v.count
	if start_lnum <= 0 or end_lnum <= 0 then
		return 0
	end

	for client_id in
		vim.iter(format_buf_clients[buf])
			:filter(function(client)
				return client.supports_method("textDocument/rangeFormatting")
			end)
			:map(function(client)
				return client.id
			end)
	do
		vim.lsp.buf.format({
			bufnr = buf,
			id = client_id,
			range = {
				start = { line = start_lnum - 1, character = 0 },
				["end"] = { line = end_lnum - 1, character = 0 },
			},
		})
	end
	-- do not run builtin formatter.
	return 0
end

return {
	["textDocument/definition"] = function(client, buf)
		vim.keymap.set("n", "gd", function()
			client.request(
				"textDocument/definition",
				vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil,
				buf
			)
		end, { buffer = buf })
	end,

	["textDocument/declaration"] = function(client, buf)
		vim.keymap.set("n", "gD", function()
			client.request(
				"textDocument/declaration",
				vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil,
				buf
			)
		end, { buffer = buf })
	end,

	["textDocument/typeDefinition"] = function(client, buf)
		vim.keymap.set("n", "gt", function()
			client.request(
				"textDocument/typeDefinition",
				vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil,
				buf
			)
		end, { buffer = buf })
	end,

	["textDocument/references"] = function(client, buf)
		vim.keymap.set("n", "gr", function()
			local params = vim.lsp.util.make_position_params(0, client.offset_encoding)
			params.context = { includeDeclaration = true }
			client.request("textDocument/references", params, nil, buf)
		end, { buffer = buf })
	end,

	["textDocument/implementation"] = function(client, buf)
		vim.keymap.set("n", "gI", function()
			client.request(
				"textDocument/implementation",
				vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil,
				buf
			)
		end, { buffer = buf })
	end,

	["textDocument/rename"] = function(client, buf)
		vim.keymap.set("n", "<F2>", function()
			vim.lsp.buf.rename(nil, {
				filter = function(filter_client)
					return filter_client.id == client.id
				end,
			})
		end, { buffer = buf })
	end,

	["textDocument/hover"] = function(client, buf)
		table.insert(hover_buf_clients[buf], client)
		vim.keymap.set("n", "K", function()
			for _, stored_client in ipairs(hover_buf_clients[buf]) do
				stored_client.request(
					"textDocument/hover",
					vim.lsp.util.make_position_params(0, client.offset_encoding),
					vim.lsp.with(vim.lsp.handlers.hover, { silent = true }),
					buf
				)
			end
		end, { buffer = buf })
	end,

	["textDocument/documentSymbol"] = function(client, buf)
		vim.b[buf].neotree_doc_symbol_lsp_name = client.name
	end,

	["textDocument/signatureHelp"] = function(client, buf)
		vim.keymap.set({ "n", "i" }, "<c-s>", function()
			client.request(
				"textDocument/signatureHelp",
				vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil,
				buf
			)
		end, { buffer = buf })
	end,

	["textDocument/codeLens"] = function(client, buf)
		vim.keymap.set("n", "gA", vim.lsp.codelens.run, { buffer = buf })
		vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				if client.supports_method("textDocument/codeLens") then
					vim.lsp.codelens.refresh({ bufnr = buf })
				end
			end,
		})
	end,

	["textDocument/documentHighlight"] = function(client, buf)
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				if client.supports_method("textDocument/documentHighlight") then
					vim.lsp.buf.document_highlight()
				end
			end,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "WinLeave" }, {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				if client.supports_method("textDocument/documentHighlight") then
					vim.lsp.buf.clear_references()
				end
			end,
		})
	end,

	["textDocument/formatting"] = function(client, buf)
		table.insert(format_buf_clients[buf], client)
		local format = function()
			for _, stored_client in ipairs(format_buf_clients[buf]) do
				vim.lsp.buf.format({ id = stored_client.id, bufnr = buf })
			end
		end
		vim.keymap.set("n", "gQ", format, { buffer = buf })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "lsp",
			buffer = buf,
			callback = function()
				if Format_on_save then
					format()
				end
			end,
		})

		vim.bo[buf].formatexpr = string.format("v:lua.lsp_format_expr(%s)", buf)
	end,
}
