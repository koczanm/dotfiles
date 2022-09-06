local M = {}

local override = require "custom.override"

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
    ["goolord/alpha-nvim"] = override.alpha,
    ["lukas-reineke/indent-blankline.nvim"] = override.blanklink,
    ["williamboman/mason.nvim"] = override.mason,
  },

  user = require "custom.plugins",
}

M.ui = {
  theme = "chadracula",
}

M.mappings = require "custom.mappings"

return M
