return {
	{
		url = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = "^3",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{
				url = "https://github.com/MunifTanjim/nui.nvim",
				lazy = true,
			},
		},
		init = function()
			vim.keymap.set("n", "-", "<cmd>Neotree filesystem toggle reveal_force_cwd<cr>")
			-- vim.keymap.set("n", "gs", "<cmd>Neotree show document_symbols toggle<cr>")
		end,
		opts = {
			close_if_last_window = true,
			auto_clean_after_session_restore = true,
			window = {
				width = 50,
				mappings = {
					["l"] = "toggle_node",
					["h"] = "close_node",
					["K"] = "focus_preview",
				},
			},
			sources = {
				"filesystem",
				"document_symbols",
			},
			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem" },
					{ source = "document_symbols" },
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					force_visible_in_empty_folder = true,
				},
			},
			document_symbols = {
				follow_cursor = true,
				client_filters = {
					fn = function(name)
						return vim.b.neotree_doc_symbol_lsp_name == name
					end,
				},
			},
		},
	},
}
