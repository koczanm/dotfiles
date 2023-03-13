local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	-- DEFAULT PLUGINS

	-- LSP config
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			-- formatting & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
			"jay-babu/mason-null-ls.nvim",
			-- LSP servers
			{
				"williamboman/mason.nvim",
				config = function(_, opts)
					dofile(vim.g.base46_cache .. "mason")
					require("mason").setup(opts)
					vim.api.nvim_create_user_command("MasonInstallAll", function()
						vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
					end, {})
					require("custom.configs.lspconfig")
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			-- debugging
			{
				"mfussenegger/nvim-dap",
				config = function()
					require("custom.configs.dap")
				end,
			},
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"jay-babu/mason-nvim-dap.nvim",
		},
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

	-- which-key
	{
		"folke/which-key.nvim",
		enabled = true,
	},

	-- nvim-colorizer
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
	},

	-- CUSTOM PLUGINS

	-- toggle LSP diagnostics
	{
		"WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
		cmd = "ToggleDiag",
		config = function()
			require("toggle_lsp_diagnostics").init({
				start_on = false,
			})
		end,
	},

	-- smooth scrolling
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},

	-- easy neovim-tmux navigation
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({})
		end,
	},

	-- stabilize window open/close events
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
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
		config = function()
			require("custom.configs.hlargs")
		end,
	},

	-- surround selections
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- prettier UI
	{
		"folke/noice.nvim",
		event = "VimEnter",
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
