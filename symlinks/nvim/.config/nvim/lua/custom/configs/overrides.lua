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

M.telescope = {
	defaults = {
		prompt_prefix = "   ",
	},
}

return M
