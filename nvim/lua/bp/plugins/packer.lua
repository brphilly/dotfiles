-- TODO(brphilly): Install nvim-dap
require("packer").startup({
	function()
		local use = require("packer").use
		local ts_ft = require("vim.treesitter.health").list_parsers()
		if next(ts_ft) == nil then
			ts_ft = nil
		else
			for i, ft in ipairs(ts_ft) do
				ts_ft[i] = vim.fn.fnamemodify(ft, ":t:r")
			end
		end

		-- Not lazy loaded:
		use({
			vim.fn.stdpath("config") .. "/my-plugins/nord",
			config = 'require("bp.plugins.nord")',
		})

		use({
			"shadmansaleh/lualine.nvim",
			config = 'require("bp.plugins.lualine")',
			wants = "nvim-web-devicons",
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
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			config = 'require("bp.plugins.nvim-treesitter")',
			ft = ts_ft,
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
				{
					"romgrk/nvim-treesitter-context",
					config = function()
						require("treesitter-context").setup({ throttle = true, max_lines = 1 })
					end,
					after = "nvim-treesitter",
				},
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
				require("project_nvim").setup({})
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
			event = "InsertEnter",
			wants = "lspkind-nvim",
			requires = {
				{ "hrsh7th/cmp-path", after = "nvim-cmp", opt = true },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp", opt = true },
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
				{
					"onsails/lspkind-nvim",
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
			},
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
			},
		})

		use({
			"~/projects/hop.nvim",
			config = 'require("bp.plugins.hop.config")',
			setup = 'require("bp.plugins.hop.setup")',
			module = "hop",
		})

		-- stylua: ignore
		use({
			"tpope/vim-commentary",
			keys = {
				{"n", "gc"}, {"n", "gcc"}, {"n", "gcu"}, {"n", "cgc"},
				{"x", "gc"},
				{"o", "gc"},
			},
		})

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

		-- stylua: ignore
		use({
			"ggandor/lightspeed.nvim",
			config = "require('bp.plugins.lightspeed')",
			keys = {
				{"n", "s"}, {"n", "S"}, {"n", "f"}, {"n", "F"}, {"n", "t"}, {"n", "T"},
				{"x", "s"}, {"x", "f"}, {"x", "F"}, {"x", "t"}, {"x", "T"},
				{"o", "z"}, {"o", "Z"}, {"o", "f"}, {"o", "F"}, {"o", "t"}, {"o", "T"},
			},
			wants = "vim-repeat",
			requires = {{"tpope/vim-repeat", opt = true}},
		})

		use({
			"kyazdani42/nvim-tree.lua",
			setup = 'require("bp.plugins.nvim-tree.setup")',
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
