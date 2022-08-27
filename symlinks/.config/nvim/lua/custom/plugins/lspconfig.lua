local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local utils = require "custom.plugins.utils"

   lspconfig.pyright.setup {
      before_init = function(_, config)
          config.setting.python.pythonPath = utils.get_python_path(config.root_dir)
      end,
      on_attach = attach,
   }

   -- lspservers with default config
   local servers = { "bashls", "tsserver" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
end

return M
