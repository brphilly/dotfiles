return {
	["textDocument/definition"] = function(client, buf)
		vim.keymap.set("n", "gd", function()
			client.request("textDocument/definition", vim.lsp.util.make_position_params(0, client.offset_encoding), nil,
				buf)
		end, { buffer = buf })
	end,

	["textDocument/declaration"] = function(client, buf)
		vim.keymap.set("n", "gD", function()
			client.request("textDocument/declaration", vim.lsp.util.make_position_params(0, client.offset_encoding), nil,
				buf)
		end, { buffer = buf })
	end,

	["textDocument/typeDefinition"] = function(client, buf)
		vim.keymap.set("n", "gt", function()
			client.request("textDocument/typeDefinition", vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil, buf)
		end, { buffer = buf })
	end,

	["textDocument/references"] = function(client, buf)
		vim.keymap.set("n", "gr", function()
			client.request("textDocument/references", vim.lsp.util.make_position_params(0, client.offset_encoding), nil,
				buf)
		end, { buffer = buf })
	end,

	["textDocument/implementation"] = function(client, buf)
		vim.keymap.set("n", "gI", function()
			client.request("textDocument/implementation", vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil, buf)
		end, { buffer = buf })
	end,

	["textDocument/rename"] = function(client, buf)
		vim.keymap.set("n", "<F2>", function()
			vim.lsp.buf.rename(nil, { filter = function(filter_client) return filter_client.id == client.id end })
		end, { buffer = buf })
	end,

	["textDocument/hover"] = function(client, buf)
		vim.keymap.set("n", "K", function()
			client.request("textDocument/hover", vim.lsp.util.make_position_params(0, client.offset_encoding), nil, buf)
		end, { buffer = buf })
	end,

	["textDocument/signatureHelp"] = function(client, buf)
		vim.keymap.set({ "n", "i" }, "<c-s>", function()
			client.request("textDocument/signatureHelp", vim.lsp.util.make_position_params(0, client.offset_encoding),
				nil, buf)
		end, { buffer = buf })
	end,

	["textDocument/codeLens"] = function(client, buf)
		vim.keymap.set("n", "gL", vim.lsp.codelens.run, { buffer = buf })
		vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" },
			{
				group = "lsp",
				buffer = buf,
				callback = function(_)
					vim.lsp.codelens.refresh()
				end
			}
		)
	end,

	["textDocument/documentHighlight"] = function(client, buf)
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				vim.lsp.buf.document_highlight()
			end
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "WinLeave" },
			{
				group = "lsp",
				buffer = buf,
				callback = function(_)
					vim.lsp.buf.clear_references()
				end
			})
	end,

	["textDocument/formatting"] = function(client, buf)
		vim.keymap.set("n", "gF", function()
			vim.lsp.buf.format({ id = client.id, bufnr = buf })
		end, { buffer = buf })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = "lsp",
			buffer = buf,
			callback = function(_)
				vim.lsp.buf.format({ id = client.id, bufnr = buf })
			end
		})
	end,
}
