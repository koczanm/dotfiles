local override = require "custom.plugins.override"
local HOME = os.getenv("HOME")

-- set dedicated Python virtualenvs for NeoVim
vim.g.python_host_prog = HOME..".pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = HOME..".pyenv/versions/neovim3/bin/python"

local M = {}

M.options = {

   user = function()
      require "custom.options"
   end,
}

M.plugins = {

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   override = {
      ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
      ["nvim-telescope/telescope.nvim"] = override.telescope,
   },

   user = require "custom.plugins",
}

M.ui = {
   theme = "chadracula",
}

M.mappings = require "custom.mappings"

return M