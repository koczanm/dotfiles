return {
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
   {
      "karb94/neoscroll.nvim",
      config = function()
         require("neoscroll").setup()
      end
   },
   {
      "luukvbaal/stabilize.nvim",
      config = function()
         require("stabilize").setup()
      end
   },
}