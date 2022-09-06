return {
  -- Dashboard
  ["goolord/alpha-nvim"] = {
    cmd = "Alpha",
    disable = false,
  },

  -- Smooth scrolling
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("custom.plugins.smolconfigs").scroll()
    end,
  },

  -- Dim inactive windows
  ["andreadev-it/shade.nvim"] = {
    module = "shade",
    config = function()
      require("custom.plugins.smolconfigs").shade()
    end,
  },

  -- Stabilize window open/close events
  ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("custom.plugins.smolconfigs").stabilize()
    end,
  },

  -- Tree view for symbols
  ["simrat39/symbols-outline.nvim"] = {
    cmd = "SymbolsOutline",
    config = function()
      require("custom.plugins.smolconfigs").symbols()
  },

  -- Toggle LSP diagnostics
  ["WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"] = {
    after = "nvim-lspconfig",
    cmd = "ToggleDiag",
    config = function()
      require("custom.plugins.smolconfigs").lsp_diag()
    end,
  },

  -- Easy neovim-tmux navigation
  ["alexghergh/nvim-tmux-navigation"] = {
    config = function ()
      require("custom.plugins.smolconfigs").tmux()
    end,
  },

  -- Formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- LSP
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end
  }
}
