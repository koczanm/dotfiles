local M = {}

M.disabled = {
	n = {
		-- general
		["<leader>n"] = "",
		["<leader>tt"] = "",

		-- lspconfig
		["<leader>ra"] = "",
		["<leader>wK"] = "",
		["<leader>wa"] = "",
		["<leader>wr"] = "",

		-- nvterm
		["<leader>h"] = "",
		["<leader>v"] = "",
		["<A-h>"] = "",
		["<A-v>"] = "",

		-- telescope
		["<leader>cm"] = "",
		["<leader>gt"] = "",
		["<leader>pt"] = "",
		["<leader>tk"] = "",
	},
}

M.general = {
	n = {
		-- update nvchad
		["<leader>uu"] = { "<cmd> :NvChadUpdate <CR>", "ﮮ  update nvchad" },

		-- new buffer
		["<leader>b"] = { "<cmd> enew <CR>", "﬘  new buffer" },

		-- switch between windows
		["<C-h>"] = {
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
			end,
			"  window left",
		},
		["<C-l>"] = {
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateRight()
			end,
			"  window right",
		},
		["<C-j>"] = {
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateDown()
			end,
			"  window down",
		},
		["<C-k>"] = {
			function()
				require("nvim-tmux-navigation").NvimTmuxNavigateUp()
			end,
			"  window up",
		},

		-- resize windows
		["<leader>w="] = { "<C-w>=", "  realign" },
		["<leader>wh"] = { "<C-w><", "ﲕ  expand left" },
		["<leader>wl"] = { "<C-w>>", "ﲖ  expand right" },
		["<leader>wk"] = { "<C-w>+", "ﲗ  expand up" },
		["<leader>wj"] = { "<C-w>-", "ﲔ  expand down" },

		-- split windows
		["<leader>ws"] = { "<C-w>s", "ﰮ  new horizontal window" },
		["<leader>wv"] = { "<C-w>v", "ﰴ  new vertical window" },

		-- close windows
		["<leader>wx"] = { "<cmd> quit <CR>", "  close window" },

		-- quit nvim
		["<leader>qq"] = { "<cmd> qa! <CR>", "  quit" },
		["<leader>wq"] = { "<cmd> wqa <CR>", "  save and quit" },
	},
}

M.tabufline = {
	n = {
		-- close buffer + hide terminal buffer
		["<leader>x"] = {
			function()
				require("nvchad_ui.tabufline").close_buffer()
			end,
			"  close buffer",
		},
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<leader>/"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"  toggle comment",
		},
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"  toggle comment",
		},
	},
}

M.lspconfig = {
	n = {
		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"  lsp definition type",
		},
		["<leader>rn"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"凜 lsp rename",
		},
		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"  lsp code_action",
		},
		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"  goto prev",
		},
		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"  goto_next",
		},
		["<leader>f"] = {
			function()
				vim.diagnostic.open_float()
			end,
			"  floating diagnostic",
		},
		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"  diagnostic setloclist",
		},

		["<leader>fm"] = {
			function()
				vim.lsp.buf.formatting({})
			end,
			"  lsp formatting",
		},
		["<leader>wsa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"  add workspace folder",
		},
		["<leader>wsr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"  remove workspace folder",
		},
		["<leader>wsl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"  list workspace folders",
		},
	},
}

M.nvterm = {
	t = {
		-- toggle in terminal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"  toggle floating term",
		},
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"  toggle floating term",
		},
	},
}

M.nvimtree = {
	n = {
		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "  focus nvimtree" },
	},
}

M.outline = {
	n = {
		["<leader>ls"] = { "<cmd> SymbolsOutline <CR>", "  outline view" },
	},
}

M.telescope = {
	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "  live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "  find oldfiles" },
		["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "  show keys" },

		-- git
		["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "שׂ  git commits" },
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "  git commits" },
		["<leader>gst"] = { "<cmd> Telescope git_status <CR>", "  git status" },

		-- pick a hidden term
		["<leader>ft"] = { "<cmd> Telescope terms <CR>", "  pick hidden term" },
	},
}

M.tld = {
	n = {
		["<leader>td"] = { "<cmd> ToggleDiag <CR>", "𥳐 diagnostics" },
	},
}

return M
