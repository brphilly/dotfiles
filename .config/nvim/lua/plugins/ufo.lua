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
			end)
			vim.keymap.set("n", "zM", function()
				vim.b.ufo_foldlevel = 0
				require("ufo").closeAllFolds()
			end)
			vim.keymap.set("n", "zr", function()
				vim.b.ufo_foldlevel = (vim.b.ufo_foldlevel or 99) + vim.v.count1
				require("ufo").closeFoldsWith(vim.b.ufo_foldlevel)
			end)
			vim.keymap.set("n", "zm", function()
				vim.b.ufo_foldlevel = math.max((vim.b.ufo_foldlevel or 99) - vim.v.count1, 0)
				require("ufo").closeFoldsWith(vim.b.ufo_foldlevel)
			end)

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					local ts_lang = vim.treesitter.language.get_lang(filetype)
					if ts_lang == nil then
						return
					end
					local has_parser = require("nvim-treesitter.parsers").has_parser(ts_lang)
					local has_ts_folds = has_parser and vim.treesitter.query.get(ts_lang, "folds")
					if buftype == "" and has_ts_folds then
						return { "lsp", "treesitter" }
					elseif has_ts_folds then
						return { "treesitter", "indent" }
					else
						return "indent"
					end
				end,
			})
		end,
	},
}
