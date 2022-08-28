return {
   -- Dashboard
   ["goolord/alpha-nvim"] = {
      disable = true,
   },
   -- Tree view for symbols
   ["simrat39/symbols-outline.nvim"] = {
      cmd = "SymbolsOutline",
      config = function()
         require("symbols-outline").setup()
      end,
   },
   -- Formatting and linting
   ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   -- Toggle LSP diagnostics
   ["WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"] = {
      cmd = "ToggleDiag",
      config = function()
         require("toggle_lsp_diagnostics").init()
      end,
   },
   -- Smooth scrolling
   ["karb94/neoscroll.nvim"] = {
      config = function()
         require("neoscroll").setup()
      end,
   },
   -- Stabilize window open/close events
   ["luukvbaal/stabilize.nvim"] = {
      config = function()
         require("stabilize").setup()
      end,
   },
   -- Easy neovim-tmux navigation
   ["alexghergh/nvim-tmux-navigation"] = {
      config = function ()
         require("nvim-tmux-navigation").setup({})
      end,
   }
}