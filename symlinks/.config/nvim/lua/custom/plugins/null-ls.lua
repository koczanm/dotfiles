local null_ls = require "null-ls"
local b = null_ls.builtins
local HOME = os.getenv("HOME")

local sources = {
   -- JSON & YAML
   b.formatting.prettierd.with { filetypes = { "json", "yaml" }},

   -- Docker
   b.diagnostics.hadolint,

   -- JavaScript & TypeScript
   b.formatting.eslint_d.with { filetypes = { "javascript", "typescript" }},

   -- Python
   b.diagnostics.flake8.with {
      extra_args = { "--max-line-length", "119" }
   },
   b.formatting.black.with { 
      extra_args = { "--line-length", "119" }
   },
   b.formatting.isort.with {
      extra_args = { "--line-length", "119" }
   },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,

      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
         end
      end,
   }
end

return M
