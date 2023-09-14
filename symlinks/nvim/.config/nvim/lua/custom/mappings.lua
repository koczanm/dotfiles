local M = {}

M.disabled = {
   n = {
      -- general
      ["<leader>b"] = "",
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
      ["<leader>uu"] = { "<cmd> :NvChadUpdate <CR>", "󰚰  update nvchad" },

      -- new buffer
      ["<leader>n"] = { "<cmd> enew <CR>", "󰏌  new buffer" },

      -- switch between windows
      ["<C-w>h"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
         end,
         "󰁍  window left",
      },
      ["<C-w>l"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateRight()
         end,
         "󰁔  window right",
      },
      ["<C-w>j"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateDown()
         end,
         "󰁅  window down",
      },
      ["<C-w>k"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateUp()
         end,
         "󰁝  window up",
      },

      -- resize windows
      ["<leader>w="] = { "<C-w>=", "󰁌  realign" },
      ["<leader>wh"] = { "<C-w><", "󰞗  expand left" },
      ["<leader>wl"] = { "<C-w>>", "󰞘  expand right" },
      ["<leader>wk"] = { "<C-w>+", "󰞙  expand up" },
      ["<leader>wj"] = { "<C-w>-", "󰞖  expand down" },

      -- split windows
      ["<C-w>x"] = { "<C-w>s", "󰛀  new horizontal window" },
      ["<C-w>v"] = { "<C-w>v", "󰛂  new vertical window" },

      -- quit nvim
      ["<leader>qq"] = { "<cmd> qa! <CR>", "󰱝  quit" },
      ["<leader>wq"] = { "<cmd> wqa <CR>", "󰱝  save and quit" },
   },
}

M.tabufline = {
   n = {
      -- close buffer + hide terminal buffer
      ["<leader>x"] = {
         function()
            require("nvchad.tabufline").close_buffer()
         end,
         "󰅖  close buffer",
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
         "󰆈  toggle comment",
      },
   },

   v = {
      ["<leader>/"] = {
         "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
         "󰆈  toggle comment",
      },
   },
}

M.dap = {
   n = {
      ["<leader>dc"] = {
         function()
            require("dap").continue()
         end,
         "  Continue",
      },
      ["<leader>dq"] = {
         function()
            require("dap").disconnect()
         end,
         "  Diconnect",
      },
      ["<leader>dl"] = {
         function()
            require("dap").step_into()
         end,
         "  Step into",
      },
      ["<leader>dk"] = {
         function()
            require("dap").step_out()
         end,
         "  Step out",
      },
      ["<leader>dj"] = {
         function()
            require("dap").step_over()
         end,
         "  Step over",
      },
      ["<leader>db"] = {
         function()
            require("dap").toggle_breakpoint()
         end,
         "  Toggle breakpoint",
      },
      ["<leader>dB"] = {
         function()
            require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
         end,
         "  Set conditional breakpoint",
      },
      ["<leader>de"] = {
         function()
            require("dapui").eval()
         end,
         "  Evaluate",
      },
      ["<leader>ds"] = {
         function()
            require("dapui").float_element("scopes", { enter = true })
         end,
         "  Show scopes",
      },
      ["<leader>dw"] = {
         function()
            require("dapui").float_element("watches", { enter = true })
         end,
         "  Show watches",
      },
      ["<leader>dr"] = {
         function()
            require("osv").launch({ port = 8086 })
         end,
         "  Run nvim debug server",
      },
   },
}

M.lspconfig = {
   n = {
      ["<leader>D"] = {
         function()
            vim.lsp.buf.type_definition()
         end,
         "󰅭  lsp definition type",
      },
      ["<leader>rn"] = {
         function()
            require("nvchad.renamer").open()
         end,
         "󰑕  lsp rename",
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
         "󰉧  floating diagnostic",
      },
      ["<leader>q"] = {
         function()
            vim.diagnostic.setloclist()
         end,
         "  diagnostic setloclist",
      },

      ["<leader>fm"] = {
         function()
            vim.lsp.buf.format({ async = true })
         end,
         "󰉢  lsp formatting",
      },
      ["<leader>wsa"] = {
         function()
            vim.lsp.buf.add_workspace_folder()
         end,
         "󰮝  add workspace folder",
      },
      ["<leader>wsr"] = {
         function()
            vim.lsp.buf.remove_workspace_folder()
         end,
         "󰮞  remove workspace folder",
      },
      ["<leader>wsl"] = {
         function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end,
         "󰥩  list workspace folders",
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
      ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "󰙅  focus nvimtree" },
   },
}

M.outline = {
   n = {
      ["<leader>ls"] = { "<cmd> SymbolsOutline <CR>", "  outline view" },
   },
}

M.telescope = {
   n = {
      -- find
      ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
      ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
      ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
      ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "  find word" },
      ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "  find oldfiles" },
      ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "󰘥  help page" },
      ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "  show keys" },

      -- git
      ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "שׂ  git commits" },
      ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "  git commits" },
      ["<leader>gst"] = { "<cmd> Telescope git_status <CR>", "  git status" },

      -- pick a hidden term
      ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "  pick hidden term" },
   },
}

M.trouble = {
   n = {
      ["<leader>xx"] = {
         function()
            require("trouble").toggle()
         end,
         "󱠪  diagnostics",
      },
      ["<leader>xq"] = {
         function()
            require("trouble").toggle("quickfix")
         end,
         "󰁨  quickfix list",
      },
      ["gR"] = {
         function()
            require("trouble").toggle("lsp_references")
         end,
         "  lsp references",
      },
   },
}

return M
