local M = {}

M.general = {

   n = {
      -- switch between windows
      ["<C-h>"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
         end,
         " window left",
      },
      ["<C-l>"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateRight()
         end,
         " window right",
      },
      ["<C-j>"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateUp()
         end,
         " window down",
      },
      ["<C-k>"] = {
         function()
            require("nvim-tmux-navigation").NvimTmuxNavigateDown()
         end,
         " window up",
      },

      -- resize windows
      ["<leader>w="] = { "<C-w>=", "  realign"},
      ["<leader>wh"] = { "<C-w><", "ﲕ  expand left"},
      ["<leader>wl"] = { "<C-w>>", "ﲖ  expand right"},
      ["<leader>wk"] = { "<C-w>+", "ﲗ  expand up"},
      ["<leader>wj"] = { "<C-w>-", "ﲔ  expand down"},

      -- split windows
      ["<leader>ws"] = { "<C-w>s", "ﰮ  new horizontal window"},
      ["<leader>wv"] = { "<C-w>v", "ﰴ  new vertical window"},

      -- close windows
      ["<leader>wq"] = { "<cmd> quit <CR>", "  close window"},
      ["<leader>wQ"] = { "<cmd> quit! <CR>", "  force close window"},

      -- quit nvim
      ["<leader>qq"] = { "<cmd> quitall <CR>", "  quit" },
      ["<leader>QQ"] = { "<cmd> quitall! <CR>", "  force quit" },
   },
}

M.lspconfig = {

   n = {
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

      -- disable
      ["<leader>wK"] = "",
      ["<leader>wa"] = "",
      ["<leader>wr"] = "",
   },
}

M.nvterm = {

   t = {
      -- toggle in terminal mode
      ["<leader>tf"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },
      ["<leader>ts"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
      ["<leader>tv"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },
   },

   n = {
      -- toggle in normal mode
      ["<leader>tf"] = {
         function()
            require("nvterm.terminal").toggle "float"
         end,
         "   toggle floating term",
      },
      ["<leader>ts"] = {
         function()
            require("nvterm.terminal").toggle "horizontal"
         end,
         "   toggle horizontal term",
      },
      ["<leader>tv"] = {
         function()
            require("nvterm.terminal").toggle "vertical"
         end,
         "   toggle vertical term",
      },

      -- disable
      ["<leader>h"] = "",
      ["<leader>v"] = ""
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
      ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "  live grep"},
      ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
      ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
      ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
      ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

      -- git
      ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "שׂ  git commits" },
      ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "  git commits" },
      ["<leader>gst"] = { "<cmd> Telescope git_status <CR>", "  git status" },

      -- pick a hidden term
      ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "  pick hidden term" },

      -- disable
      ["<leader>cm"] = "",
      ["<leader>gt"] = "",
      ["<leader>pt"] = "",
      ["<leader>tk"] = "",
   },
}

M.tld = {

   n = {
      ["<leader>td"] = { "<cmd> ToggleDiag <CR>", "𥳐  diagnostics" },
   },
}

return M
