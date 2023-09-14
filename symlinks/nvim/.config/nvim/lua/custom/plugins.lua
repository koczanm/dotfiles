local overrides = require("custom.configs.overrides")

local plugins = {
	-- DEFAULT PLUGINS

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- formatting & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
			-- debugging
			{
				"mfussenegger/nvim-dap",
				config = function()
					require("custom.configs.dap")
				end,
			},
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"jbyuki/one-small-step-for-vimkind",
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	-- mason
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},

	-- nvim-colorizer
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},

	-- CUSTOM PLUGINS

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		keys = { "<C-d>", "<C-u>" },
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- easy neovim-tmux navigation
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("nvim-tmux-navigation").setup({})
		end,
	},

	-- tree view for symbols
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- jump to fuzzy match word
	{
		"ggandor/leap.nvim",
		event = "BufRead",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- highlight args' definitions
	{
		"m-demare/hlargs.nvim",
		ft = { "lua", "python", "rust" },
		config = function()
			require("custom.configs.hlargs")
		end,
	},

	-- surround selections
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- prettier UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("custom.configs.noice")
		end,
	},
}
return plugins
