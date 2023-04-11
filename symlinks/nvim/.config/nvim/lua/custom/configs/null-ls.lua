local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
	-- bash
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- docker
	b.diagnostics.hadolint,

	-- javascript & typescript
	b.formatting.eslint_d.with({ filetypes = { "javascript", "typescript" } }),

	-- lua
	b.formatting.stylua,

	-- python
	b.formatting.black.with({
		extra_args = { "--line-length", "119" },
	}),
	b.formatting.isort.with({
		extra_args = { "--line-length", "119" },
	}),
	b.diagnostics.ruff.with({
		extra_args = { "--line-length", "119" },
	}),

	-- rust
	b.formatting.rustfmt,

	-- others
	b.diagnostics.actionlint,
	b.formatting.prettier.with({ filetypes = { "json", "markdown", "toml", "yaml" } }),
}

null_ls.setup({
	debug = true,
	sources = sources,
})
