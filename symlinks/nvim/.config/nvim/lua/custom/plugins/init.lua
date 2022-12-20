local overrides = require("custom.plugins.overrides")

return {

	-- DEFAULT PLUGINS

	-- which-key
	["folke/which-key.nvim"] = {
		disable = false,
	},

	-- dashboard
	["goolord/alpha-nvim"] = {
		disable = false,
		override_options = overrides.alpha,
	},

	-- LSP config
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- treesitter
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	-- indent guides
	["lukas-reineke/indent-blankline.nvim"] = {
		override_options = overrides.blankline,
	},

	-- easy installation of LSP servers, linters, formaters etc.
	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	-- fuzzy finder
	["nvim-telescope/telescope.nvim"] = {
		override_options = overrides.telescope,
	},

	-- CUSTOM PLUGINS

	-- toggle LSP diagnostics
	["WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"] = {
		after = "nvim-lspconfig",
		cmd = "ToggleDiag",
		config = function()
			require("custom.plugins.diagnostics")
		end,
	},

	-- smooth scrolling
	["karb94/neoscroll.nvim"] = {
		config = function()
			require("custom.plugins.neoscroll")
		end,
	},

	-- formatting & linting
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- stabilize window open/close events
	["luukvbaal/stabilize.nvim"] = {
		config = function()
			require("custom.plugins.stabilize")
		end,
	},

	-- tree view for symbols
	["simrat39/symbols-outline.nvim"] = {
		cmd = "SymbolsOutline",
		config = function()
			require("custom.plugins.symbols")
		end,
	},

	-- easy neovim-tmux navigation
	["alexghergh/nvim-tmux-navigation"] = {
		config = function()
			require("custom.plugins.tmux")
		end,
	},
}
