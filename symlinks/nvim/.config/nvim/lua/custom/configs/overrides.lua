local M = {}

M.treesitter = {
	ensure_installed = {
		"bash",
		"dockerfile",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"python",
		"regex",
		"rust",
		"typescript",
		"toml",
		"yaml",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- bash
		"bash-language-server",
		"shellcheck",
		"shfmt",

		-- docker
		"dockerfile-language-server",
		"hadolint",

		-- json
		"json-lsp",

		-- lua
		"lua-language-server",
		"stylua",

		-- markdown
		"marksman",

		-- python
		"black",
		"debugpy",
		"isort",
		"pyright",
		"ruff",

		-- rust
		"rust-analyzer",
    "rustfmt",

		-- yaml
		"actionlint",
		"yaml-language-server",

		-- web
		"eslint_d",
		"prettierd",
		"typescript-language-server",
	},
}

M.telescope = {
	defaults = {
		prompt_prefix = "   ",
	},
}

return M