return {
   {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function()
         require("symbols-outline").setup()
      end
   },
   -- Formatting and linting
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   -- Toggle LSP diagnostics
   {
      "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
      config = function()
         require("toggle_lsp_diagnostics").init()
      end,
   },
   -- Smooth scrolling
   {
      "karb94/neoscroll.nvim",
      config = function()
         require("neoscroll").setup()
      end
   },
   -- Stabilize window open/close events
   {
      "luukvbaal/stabilize.nvim",
      config = function()
         require("stabilize").setup()
      end
   },
   -- Keymaps Popup
   {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end
    }
}
