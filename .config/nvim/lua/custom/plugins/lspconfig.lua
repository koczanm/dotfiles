local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local utils = require "custom.plugins.utils"

   lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end,
   }

   lspconfig.pyright.setup {
      before_init = function(_, config)
          config.setting.python.pythonPath = utils.get_python_path(config.root_dir)
      end
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end
   }

   -- lspservers with default config
   local servers = { "bashls" }

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
