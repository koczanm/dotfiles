local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local utils = require "custom.plugins.utils"

-- Pyright
lspconfig.pyright.setup {
  on_init = function(_, config)
    config.setting.python.pythonPath = utils.get_python_path(config.root_dir)
  end,
  on_attach = on_attach,
  capabilities = capabilities,
}

-- other LSP servers
local servers = {
  "bashls",
  "dockerls",
  "jsonls",
  "marksman",
  "rust_analyzer",
  "sumneko_lua",
  "tsserver",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
