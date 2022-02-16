local M = {}

local plugin_confs = require "custom.plugins.configs"
local user_plugins = require "custom.plugins"

M.plugins = {
   status = {
      dashboard = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_confs.treesitter,
   },

   default_plugin_remove = {
      "norcalli/nvim-colorizer.lua",
   },

   install = user_plugins,
}

M.options = {
   relativenumber = true,
}

M.ui = {
   theme = "chadracula",
}

return M