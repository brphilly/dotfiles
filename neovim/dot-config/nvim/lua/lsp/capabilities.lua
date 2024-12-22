local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("blink.cmp").get_lsp_capabilities()
)

-- nvim-ufo
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

return capabilities
