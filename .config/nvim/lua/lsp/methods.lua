function _G.lsp_format_expr(client_ids, buf)
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

	for client_id in vim.iter(client_ids) do
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
		vim.keymap.set("n", "K", function()
			client.request("textDocument/hover", vim.lsp.util.make_position_params(0, client.offset_encoding), nil, buf)
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
		vim.keymap.set("n", "gL", vim.lsp.codelens.run, { buffer = buf })
		vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				vim.lsp.codelens.refresh()
			end,
		})
	end,

	["textDocument/documentHighlight"] = function(client, buf)
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				vim.lsp.buf.document_highlight()
			end,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "WinLeave" }, {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				vim.lsp.buf.clear_references()
			end,
		})
	end,

	["textDocument/formatting"] = function(clients, buf)
		if not vim.tbl_islist(clients) then
			clients = { clients }
		end

		vim.keymap.set("n", "gQ", function()
			for client in vim.iter(clients) do
				vim.lsp.buf.format({ id = client.id, bufnr = buf })
			end
		end, { buffer = buf })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				for client in vim.iter(clients) do
					vim.lsp.buf.format({ id = client.id, bufnr = buf })
				end
			end,
		})

		local client_ids = vim.iter(clients)
			:filter(function(client)
				return client.supports_method("textDocument/rangeFormatting")
			end)
			:map(function(client)
				return client.id
			end)
			:totable()
		if vim.tbl_count(client_ids) > 0 then
			vim.bo[buf].formatexpr = string.format("v:lua.lsp_format_expr(%s, %s)", vim.inspect(client_ids), buf)
		end
	end,
}
