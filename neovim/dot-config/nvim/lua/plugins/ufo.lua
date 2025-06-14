return {
	{
		url = "https://github.com/kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = {
			{ url = "https://github.com/kevinhwang91/promise-async", lazy = true },
		},
		config = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99

			vim.keymap.set("n", "zR", function()
				vim.b.ufo_foldlevel = 99
				require("ufo").openAllFolds()
			end, { desc = "Open all folds" })
			vim.keymap.set("n", "zM", function()
				vim.b.ufo_foldlevel = 0
				require("ufo").closeAllFolds()
			end, { desc = "Close all folds" })
			vim.keymap.set("n", "zr", function()
				vim.b.ufo_foldlevel = (vim.b.ufo_foldlevel or 99) + vim.v.count1
				require("ufo").closeFoldsWith(vim.b.ufo_foldlevel)
			end, { desc = "Increase fold level" })
			vim.keymap.set("n", "zm", function()
				vim.b.ufo_foldlevel = math.max((vim.b.ufo_foldlevel or 99) - vim.v.count1, 0)
				require("ufo").closeFoldsWith(vim.b.ufo_foldlevel)
			end, { desc = "Decrease fold level" })

			require("ufo").setup({
				provider_selector = function(_, filetype, buftype)
					local language = vim.treesitter.language.get_lang(filetype)
					if language == nil then
						return
					end

					local has_treesitter_folds = #vim.treesitter.query.get_files(language, "folds") > 0

					if buftype == "" and has_treesitter_folds then
						return { "lsp", "treesitter" }
					elseif has_treesitter_folds then
						return { "treesitter", "indent" }
					else
						return "indent"
					end
				end,
			})
		end,
	},
}
