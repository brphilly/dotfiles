return {
	{
		url = "https://github.com/ibhagwan/fzf-lua",
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			"default-title",
			defaults = { formatter = "path.filename_first" },
			fzf_opts = { ["--cycle"] = "" },
			grep = {
				rg_opts = "--line-number --no-heading --color=always --smart-case --max-columns=4096 --trim",
				path_shorten = true,
			},
		},
		init = function()
			vim.keymap.set("n", "<c-p>", function()
				require("fzf-lua").files()
			end)
			vim.keymap.set("n", "<leader>fs", function()
				require("fzf-lua").live_grep({
					rg_glob = true,
					rg_glob_fn = function(query)
						local regex, flags = query:match("^(.-)%s%-%-(.*)$")
						-- If no separator is detected will return the original query
						return (regex or query), flags
					end,
				})
			end)
			vim.keymap.set("n", "<leader>fb", function()
				require("fzf-lua").buffers()
			end)
			vim.keymap.set("n", "<leader>fd", function()
				require("fzf-lua").diagnostics_document()
			end)
			vim.keymap.set("n", "<leader>fD", function()
				require("fzf-lua").diagnostics_workspace()
			end)
			vim.keymap.set("n", "<leader>fg", function()
				require("fzf-lua").git_commits()
			end)
			vim.keymap.set("n", "<leader>fc", function()
				require("fzf-lua").commands()
			end)
			vim.keymap.set("n", "<leader>fh", function()
				require("fzf-lua").helptags({
					actions = {
						["enter"] = require("fzf-lua").actions.help_vert,
					},
				})
			end)
			vim.keymap.set("n", "<leader>fH", function()
				require("fzf-lua").manpages()
			end)
			vim.keymap.set("n", "<leader>fq", function()
				require("fzf-lua").quickfix()
			end)
			vim.keymap.set("n", "<leader>fQ", function()
				require("fzf-lua").quickfix_stack()
			end)
			vim.keymap.set("n", "<leader>F", function()
				require("fzf-lua").resume()
			end)
		end,
	},
}
