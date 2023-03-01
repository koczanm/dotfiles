-- overriding default plugin configs!

local M = {}

local function button(sc, txt, keybind)
	local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

	local opts = {
		position = "center",
		text = txt,
		shortcut = sc,
		cursor = 5,
		width = 36,
		align_shortcut = "right",
		hl = "AlphaButtons",
	}

	if keybind then
		opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
	end

	return {
		type = "button",
		val = txt,
		on_press = function()
			local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
			vim.api.nvim_feedkeys(key, "normal", false)
		end,
		opts = opts,
	}
end

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
		"rust",
		"typescript",
		"toml",
		"yaml",
	},
}

M.blankline = {
	filetype_exclude = {
		"alpha",
		"help",
		"lspinfo",
		"mason",
		"noice",
		"nvchad_cheatsheet",
		"packer",
		"TelescopePrompt",
		"TelescopeResult",
		"terminal",
	},
}

M.alpha = {
	header = {
		val = {
			"⠀⠀⣼⣀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⣀⣧⠀⠀",
			"⠀⠀⠸⠻⣿⣶⣦⣤⣈⢻⣶⣮⢿⣿⣿⡿⣵⢶⡟⣁⣤⣴⣶⣿⠟⠇⠀⠀",
			"⠀⠀⠀⢪⢦⣙⠻⣿⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⣿⠟⣋⡴⡕⠀⠀⠀",
			"⠀⠠⠤⣤⡩⡿⡇⣠⡙⢻⣯⣟⣿⣿⣿⣿⣻⣽⡟⢋⣄⢸⢿⢍⡤⠤⠄⠀",
			"⠀⠀⢀⣀⣤⣶⣽⡿⣿⡮⢭⣬⣽⣯⣽⣯⣥⡭⢵⣿⢿⣯⣶⣤⣀⡀⠀⠀",
			"⠒⠚⠛⠛⠛⠛⠛⠛⠓⠋⠛⢟⢿⣿⣿⡿⣻⠟⠙⠚⠛⠛⠛⠛⠛⠛⠓⠒",
			"⠀⠀⠀⠀⣀⣤⣴⣾⣿⠿⠃⠸⠷⠤⠤⠾⠇⠘⠿⣿⣷⣦⣤⣀⠀⠀⠀⠀",
			"⠀⠀⢀⣼⣿⣿⠿⠋⠁⠀⠀⢸⠧⠠⠄⠼⡇⠀⠀⠈⠙⠿⣿⣿⣧⡀⠀⠀",
			"⠀⣠⣾⠿⠋⠁⠀⣀⣴⡾⠁⢠⠀⠀⠀⠀⡄⠈⢷⣦⣀⠀⠈⠙⠿⣷⣄⠀",
			"⠴⠋⠁⠀⠀⠀⢀⣿⡟⠀⠀⢸⡇⣷⣾⢹⡇⠀⠀⢻⣿⡀⠀⠀⠀⠈⠙⠦",
			"⠀⠀⠀⠀⠀⠀⢸⠏⠀⠀⠀⠀⠁⠛⠛⠈⠀⠀⠀⠀⠹⡇⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠋⠀⠀⠀⠀⠀⢰⣀⣀⡆⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣶⣶⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
		},
	},
	buttons = {
		val = {
			button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
			button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
			button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
			button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
			button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
			button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
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
		"flake8",
		"isort",
		"pyright",
		"debugpy",

		-- rust
		"rust-analyzer",

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
