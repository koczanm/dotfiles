local null_ls = require "null-ls"

-- List of tools to install
local tools = {
  -- bash
  "shfmt",
  "shellcheck",

  -- docker
  "hadolint",

  -- javascript & typescript
  "eslint_d",

  -- lua
  "stylua",

  -- python
  "black",
  "isort",
  "ruff",

  -- rust
  "rustfmt",

  -- others
  "actionlint",
  "prettier",
}

require("mason-null-ls").setup {
  ensure_installed = tools,
  automatic_setup = true,
}

require("mason-null-ls").setup_handlers {
  -- default setup for all tools, unless a custom one is defined below
  function(source_name, methods)
    require "mason-null-ls.automatic_setup"(source_name, methods)
  end,

  -- custom setups

  -- bash
  shellcheck = function()
    null_ls.register(null_ls.builtins.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#(c)]" })
  end,

  -- javascript & typescript
  eslint_d = function()
    null_ls.register(null_ls.builtins.formatting.eslint_d.with { filetypes = { "javascript", "typescript" } })
  end,

  -- python
  black = function()
    null_ls.register(null_ls.builtins.formatting.black.with { extra_args = { "--line-length", "119" } })
  end,
  isort = function()
    null_ls.register(null_ls.builtins.formatting.isort.with { extra_args = { "--line-length", "119" } })
  end,
  ruff = function()
    null_ls.register(null_ls.builtins.diagnostics.ruff.with { extra_args = { "--line-length", "119" } })
  end,

  -- others
  prettier = function()
    null_ls.register(null_ls.builtins.formatting.prettier.with { filetypes = { "json", "markdown", "toml", "yaml" } })
  end,
}

null_ls.setup()
