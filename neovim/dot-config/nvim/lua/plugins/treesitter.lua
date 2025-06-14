return {
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			-- Install treesitter parsers
			local parsers = require("nvim-treesitter.parsers")
			local languages = vim.tbl_keys(parsers)
			local installed = require("nvim-treesitter.config").get_installed()
			local not_installed = vim.tbl_filter(function(lang)
				return not vim.tbl_contains(installed, lang)
			end, languages)

			if #not_installed > 0 then
				require("nvim-treesitter").install(not_installed)
			end

			-- Enable treesitter highlighting
			local languages_with_highlights = vim.iter(languages)
				:filter(function(lang)
					return #vim.treesitter.query.get_files(lang, "highlights") > 0
				end)
				:totable()
			local filetypes_with_highlights = vim.iter(languages_with_highlights)
				:map(function(lang)
					return vim.treesitter.language.get_filetypes(lang)
				end)
				:flatten()
				:totable()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("my.treesitter-highlights", { clear = true }),
				desc = "Try to enable treesitter highlighting",
				pattern = filetypes_with_highlights,
				callback = function()
					pcall(function()
						vim.treesitter.start()
					end)
				end,
			})

			-- Enable treesitter indentation
			local languages_with_indents = vim.iter(languages)
				:filter(function(lang)
					return #vim.treesitter.query.get_files(lang, "indents") > 0
				end)
				:totable()
			local filetypes_with_indents = vim.iter(languages_with_indents)
				:map(function(lang)
					return vim.treesitter.language.get_filetypes(lang)
				end)
				:flatten()
				:totable()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("my.treesitter-indents", { clear = true }),
				desc = "Enable treesitter indentation",
				pattern = filetypes_with_indents,
				callback = function()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
		lazy = false,
		branch = "main",
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				},
				move = {
					set_jumps = false, -- whether to set jumps in the jumplist
				},
			})

			-- Select keymaps
			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end, { desc = "Select function" })
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end, { desc = "Select function inner" })

			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end, { desc = "Select class" })
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end, { desc = "Select class inner" })

			vim.keymap.set({ "x", "o" }, "aa", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
			end, { desc = "Select parameter" })
			vim.keymap.set({ "x", "o" }, "ia", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
			end, { desc = "Select parameter inner" })

			-- Move keymaps
			vim.keymap.set({ "n", "x", "o" }, "]f", function()
				require("nvim-treesitter-textobjects.move").goto_next("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[f", function()
				require("nvim-treesitter-textobjects.move").goto_previous("@function.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "]]", function()
				require("nvim-treesitter-textobjects.move").goto_next("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[[", function()
				require("nvim-treesitter-textobjects.move").goto_previous("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "]a", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[a", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
			end)

			-- Swap keymaps
			vim.keymap.set("n", "]A", function()
				require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
			end)
			vim.keymap.set("n", "[A", function()
				require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
			end)
		end,
	},
	{
		url = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		lazy = false,
		config = function()
			vim.keymap.set("n", "<bs>", "<cmd>TSContext toggle<cr>", { desc = "Toggle treesitter context" })
		end,
	},
	{
		url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
		lazy = false,
		config = function()
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
			})

			local get_option = vim.filetype.get_option
			vim.filetype.get_option = function(filetype, option)
				return option == "commentstring"
					and require("ts_context_commentstring.internal").calculate_commentstring()
					or get_option(filetype, option)
			end
		end,
	},
}
