local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- Bash
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- Docker
  b.diagnostics.hadolint,

  -- JavaScript & TypeScript
  b.formatting.eslint_d.with { filetypes = { "javascript", "typescript" } },

  -- Lua
  b.formatting.stylua,

  -- Python
  b.diagnostics.flake8.with {
    extra_args = { "--max-line-length", "119" },
  },
  b.formatting.black.with {
    extra_args = { "--line-length", "119" },
  },
  b.formatting.isort.with {
    extra_args = { "--line-length", "119" },
  },

  -- Others
  b.diagnostics.actionlint,
  b.formatting.prettierd.with { filetypes = { "json", "markdown", "yaml" } },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
