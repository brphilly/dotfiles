-- TODO(brphilly): Install nvim-dap
-- TODO(brphilly): Install neorg
require("packer").startup({
	function()
		local use = require("packer").use

		-- Not lazy loaded:
		use({
			vim.fn.stdpath("config") .. "/my-plugins/nord",
			config = 'require("bp.plugins.nord")',
		})

		use({
			"nvim-lualine/lualine.nvim",
			config = 'require("bp.plugins.lualine")',
			wants = { "nvim-web-devicons" },
			event = "VimEnter", -- wants key requires lazy loading to work properly
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
			},
		})

		use({
			"mhinz/vim-startify",
			setup = 'require("bp.plugins.vim-startify")',
		})

		use({
			"rcarriga/nvim-notify",
			config = 'require("bp.plugins.nvim-notify")',
		})

		use({
			"https://gitlab.com/yorickpeterse/nvim-pqf",
			config = function() require("pqf").setup() end,
		})

		use({
			"chaoren/vim-wordmotion",
			setup = 'require("bp.plugins.vim-wordmotion")',
		})

		use({
			"wellle/targets.vim",
		})

		-- Lazy loaded:
		use({
			"neovim/nvim-lspconfig",
			config = 'require("bp.plugins.lsp")',
			ft = { "lua", "python", "c", "cpp" },
			wants = "cmp-nvim-lsp",
			requires = {
				{
					"kosayoda/nvim-lightbulb",
					after = "nvim-lspconfig",
					config = "require('bp.plugins.nvim-lightbulb')",
				},
				{
					"weilbith/nvim-code-action-menu",
					cmd = "CodeActionMenu",
					config = "require('bp.plugins.nvim-code-action-menu')",
				},
				{
					"j-hui/fidget.nvim",
					after = "nvim-lspconfig",
					config = function()
						require("fidget").setup({ text = { spinner = "dots_negative" }, window = {relative = "editor"}, fmt = { stack_upwards = false } })
						local p = require("nord.colours")
						vim.cmd(string.format([[
							augroup my-fidget-hl
							autocmd!
							autocmd ColorScheme nord highlight FidgetTitle guifg=%s
							autocmd ColorScheme nord highlight FidgetTask guifg=%s
							augroup END
							doautocmd my-fidget-hl ColorScheme %s
						]], p.attention_alt, p.comment, vim.g.colors_name))
					end,
				},
			},
		})

		vim.cmd("PackerLoad nvim-treesitter")
		local installed_parsers = require("bp.plugins.nvim-treesitter")
		local parsers = require("nvim-treesitter.parsers")
		local parsers_ft = {}
		for _,parser in ipairs(installed_parsers) do
			local ft = parsers.list[parser].filetype or parser
			table.insert(parsers_ft, ft)
		end
		for ft,parser in pairs(parsers.filetype_to_parsername) do
			if vim.tbl_contains(installed_parsers, parser) then table.insert(parsers_ft, ft) end
		end
		P(parsers_ft)
		use({
			"nvim-treesitter/nvim-treesitter",
			config = 'require("bp.plugins.nvim-treesitter")',
			ft = parsers_ft,
			run = ":TSUpdate",
			requires = {
				{
					"nvim-treesitter/nvim-treesitter-textobjects",
					config = 'require("bp.plugins.nvim-treesitter-textobjects")',
					after = "nvim-treesitter",
				},
				{
					"nvim-treesitter/playground",
					config = 'require("bp.plugins.nvim-treesitter-playground")',
					cmd = "TSPlaygroundToggle",
					as = "nvim-treesitter-playground",
					wants = "nvim-treesitter",
				},
				{
					"lewis6991/spellsitter.nvim",
					config = function()
						require("spellsitter").setup()
					end,
					after = "nvim-treesitter",
				},
			},
		})

		use({
			"kevinhwang91/nvim-bqf",
			config = "require('bp.plugins.nvim-bqf')",
			ft = "qf",
			requires = {
				{ "junegunn/fzf", after = "nvim-bqf" },
			},
		})

		use({
			"editorconfig/editorconfig-vim",
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"ahmedkhalf/project.nvim",
			config = function()
				vim.opt.autochdir = false
				require("project_nvim").setup({detection_methods = {"pattern", "lsp"}})
			end,
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = 'require("bp.plugins.indent-blankline")',
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"lewis6991/gitsigns.nvim",
			config = 'require("bp.plugins.gitsigns")',
			event = { "BufReadPre", "BufNewFile" },
			wants = "plenary.nvim",
			requires = { { "nvim-lua/plenary.nvim", opt = true } },
		})

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
			event = { "BufReadPre", "BufNewFile" },
		})

		use({
			"hrsh7th/nvim-cmp",
			config = 'require("bp.plugins.nvim-cmp")',
			event = { "InsertEnter", "CmdlineEnter" },
			requires = {
				{ "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", opt = true },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp", opt = true },
				{
					"hrsh7th/cmp-buffer",
					after = "nvim-cmp",
					opt = true,
				},
				{
					"saadparwaiz1/cmp_luasnip",
					after = "nvim-cmp",
					opt = true,
				},
				{
					"hrsh7th/cmp-nvim-lsp",
					after = "nvim-cmp",
					opt = true,
				},
			},
		})
		use({
			"L3MON4D3/LuaSnip",
			config = 'require("bp.plugins.luasnip")',
			event = "InsertEnter",
		})

		use({
			"nvim-telescope/telescope.nvim",
			config = 'require("bp.plugins.telescope.config")',
			setup = 'require("bp.plugins.telescope.setup")',
			module = "telescope",
			wants = { "nvim-web-devicons", "plenary.nvim" },
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
				{ "nvim-lua/plenary.nvim", opt = true },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
					after = "telescope.nvim",
					config = function()
						require("telescope").load_extension("fzf")
					end,
				},
				{
					"nvim-telescope/telescope-frecency.nvim",
					after = "telescope.nvim",
					wants = "sqlite.lua",
					setup = function()
						vim.keymap.set("n", "<leader>ffo", function() require('telescope').extensions.frecency.frecency() end)
					end,
					config = function()
						require("telescope").load_extension("frecency")
					end,
					requires = { { "tami5/sqlite.lua", opt = true } },
				},
			},
		})

		use({
			"numToStr/FTerm.nvim",
			setup = function()
				vim.keymap.set("n", "<leader>`", function() require('FTerm').toggle() end)
			end,
			config = function()
				require("FTerm").setup({ hl = "NormalFloat" })
				vim.cmd([[
					augroup fterm-toggle
					autocmd!
					autocmd TermOpen * if &filetype ==# 'FTerm' | tnoremap <buffer> <c-\><c-[> <cmd>lua require("FTerm").toggle()<cr> | endif
					augroup END
				]])
			end,
			module = "FTerm",
		})

		use({
			"lambdalisue/suda.vim",
			cmd = { "SudaRead", "SudaWrite" },
		})

		use({
			"TimUntersberger/neogit",
			config = 'require("bp.plugins.neogit.config")',
			setup = 'require("bp.plugins.neogit.setup")',
			module = "neogit",
			cmd = "Neogit",
			wants = { "diffview.nvim", "plenary.nvim" },
			requires = { { "nvim-lua/plenary.nvim", opt = true } },
		})

		use({
			"sindrets/diffview.nvim",
			config = 'require("bp.plugins.diffview.config")',
			setup = 'require("bp.plugins.diffview.setup")',
			cmd = "DiffviewOpen",
			wants = "nvim-web-devicons",
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
				{ "nvim-lua/plenary.nvim", opt = true },
			},
		})

		use({
			"rlane/pounce.nvim",
			config = "require('bp.plugins.pounce')",
			setup = function()
				vim.keymap.set("n", "s", "<cmd>Pounce<cr>")
				vim.keymap.set("n", "S", "<cmd>PounceRepeat<cr>")
				vim.keymap.set("x", "s", "<cmd>Pounce<cr>")
				vim.keymap.set("o", "z", "<cmd>Pounce<cr>")
			end,
			cmd = { "Pounce", "PounceRepeat" },
		})

		-- stylua: ignore start
		use({
			"numToStr/Comment.nvim",
			config = function() require("Comment").setup({ ignore = "^$" }) end,
			keys = {
				{"n", "gc"}, {"n", "gb"},
				{"x", "gc"}, {"x", "gb"},
			},
		})
		-- stylua: ignore end

		-- stylua: ignore
		use({
			"tpope/vim-surround",
			setup = "require('bp.plugins.vim-surround')",
			keys = {
				{"n","ds"}, {"n","cs"}, {"n","cS"}, {"n","ys"}, {"n","yS"}, {"n","yss"}, {"n","ySs"}, {"n","ySS"},
				{"x","S"}, {"x","gS"},
			},
			wants = "vim-repeat",
			requires = {{"tpope/vim-repeat", opt = true}},
		})

		use({
			"kyazdani42/nvim-tree.lua",
			setup = function()
				vim.keymap.set("n", "-", "<cmd>NvimTreeToggle<cr>")
			end,
			config = 'require("bp.plugins.nvim-tree.config")',
			cmd = "NvimTreeToggle",
			wants = "nvim-web-devicons",
			requires = {
				{
					"kyazdani42/nvim-web-devicons",
					opt = true,
					config = function()
						require("nvim-web-devicons").setup({
							default = true,
						})
					end,
				},
			},
		})

		use({
			"mbbill/undotree",
			setup = function()
				vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")
				vim.g.undotree_WindowLayout = 2
				vim.g.undotree_SetFocusWhenToggle = 1
			end,
			cmd = "UndotreeToggle",
		})

		use({
			"wbthomason/packer.nvim",
			config = 'require("bp.plugins.packer")',
			cmd = {
				"PackerInstall",
				"PackerUpdate",
				"PackerSync",
				"PackerClean",
				"PackerCompile",
				"PackerProfile",
				"PackerStatus",
				"PackerLoad",
			},
		})
	end,
	config = {
		compile_path = vim.fn.stdpath("data") .. "/site/plugin/packer_compiled.lua",
		auto_reload_compiled = false,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
