require("packer").startup({
	function()
		local use = require("packer").use

		-- Not lazy loaded:
		use({
			vim.fn.stdpath("config") .. "/my-plugins/nord",
			config = 'require("bp.plugins.nord")',
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			config = 'require("bp.plugins.nvim-treesitter")',
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
			},
		})

		use({"kosayoda/nvim-lightbulb", config = "require('bp.plugins.nvim-lightbulb')"})
		use({"weilbith/nvim-code-action-menu", cmd = "CodeActionMenu", config = "require('bp.plugins.nvim-code-action-menu')"})
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({ text = { spinner = "dots_negative" }, window = { relative = "editor" },
					fmt = { stack_upwards = false } })
				local c = require("nord.colours")
				vim.api.nvim_create_augroup("fidget-hl", {})
				vim.api.nvim_create_autocmd("ColorScheme", { group = "fidget-hl", pattern = "nord", callback = function()
					vim.api.nvim_set_hl(0, "FidgetTitle", { fg = c.attention_alt })
					vim.api.nvim_set_hl(0, "FidgetTask", { fg = c.comment })
				end })
				vim.api.nvim_exec_autocmds("ColorScheme", { group = "fidget-hl", pattern = vim.g.colors_name })
			end,
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
			"stevearc/dressing.nvim",
			config = function()
				vim.api.nvim_create_autocmd("FileType", {pattern = "DressingInput", callback = function(t)
					vim.keymap.set("i", "<c-[>", "<esc><c-w><c-q>", {buffer = t.buf})
				end})
			end,
		})

		use({
			"https://gitlab.com/yorickpeterse/nvim-pqf",
			config = function() require("pqf").setup() end,
		})

		use({
			'akinsho/git-conflict.nvim',
			config = function() require('git-conflict').setup({default_mappings = false}) end,
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
			"kevinhwang91/nvim-bqf",
			config = "require('bp.plugins.nvim-bqf')",
			ft = "qf",
		})

		use({
			"airblade/vim-rooter",
			setup = function()
				vim.g.rooter_silent_chdir = 1
				vim.g.rooter_change_directory_for_non_project_files = "current"
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
			"windwp/nvim-autopairs",
			config = function() require('nvim-autopairs').setup({}) end,
			event = "InsertEnter",
		})

		use({
			"abecodes/tabout.nvim",
			config = function() require("tabout").setup({completion = false}) end,
			event = "InsertEnter",
			wants = "nvim-treesitter",
		})

		use({
			"hrsh7th/nvim-cmp",
			config = 'require("bp.plugins.nvim-cmp")',
			event = { "InsertEnter", "CmdlineEnter" },
			requires = {
				{ "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
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
			"ThePrimeagen/harpoon",
			setup = 'require("bp.plugins.harpoon.setup")',
			config = function()
				vim.api.nvim_create_augroup("harpoon-hl", {})
				vim.api.nvim_create_autocmd("ColorScheme", {group = "harpoon-hl", pattern = "nord", callback = function()
					vim.api.nvim_set_hl(0, "HarpoonWindow", {link = "NormalFloat"})
					vim.api.nvim_set_hl(0, "HarpoonBorder", {link = "FloatBorder"})
				end})
				vim.api.nvim_exec_autocmds("ColorScheme", {group = "harpoon-hl", pattern = vim.g.colors_name})
			end,
			module = "harpoon",
		})

		use({
			"lambdalisue/suda.vim",
			cmd = { "SudaRead", "SudaWrite" },
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
