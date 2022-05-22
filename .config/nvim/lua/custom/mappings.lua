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
      ["<leader>w="] = { "<C-w>=", "   realign"},
      ["<leader>wh"] = { "<C-w><", "ﲕ   expand left"},
      ["<leader>wl"] = { "<C-w>>", "ﲖ   expand right"},
      ["<leader>wk"] = { "<C-w>+", "ﲗ   expand up"},
      ["<leader>wj"] = { "<C-w>-", "ﲔ   expand down"},

      -- split windows
      ["<leader>ws"] = { "<C-w>s", "ﰮ   new horizontal window"},
      ["<leader>wv"] = { "<C-w>v", "ﰴ   new vertical window"},

      -- close windows
      ["<leader>wq"] = { "<cmd> quit <CR>", "   close window"},
      ["<leader>wQ"] = { "<cmd> quit! <CR>", "   force close window"},

      -- quit nvim
      ["<leader>qq"] = { "<cmd> quitall <CR>", "   quit" },
      ["<leader>QQ"] = { "<cmd> quitall! <CR>", "   force quit" },
   },
}

M.lspconfig = {

   n = {
      ["<leader>wsa"] = {
         function()
            vim.lsp.buf.add_workspace_folder()
         end,
         "   add workspace folder",
      },

      ["<leader>wsr"] = {
         function()
            vim.lsp.buf.remove_workspace_folder()
         end,
         "   remove workspace folder",
      },

      ["<leader>wsl"] = {
         function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
         end,
         "   list workspace folders",
      },
   },
}

M.nvterm = {

   n = {
      -- new
      ["<leader>ts"] = {
         function()
            require("nvterm.terminal").new "horizontal"
         end,
         "   new horizontal term",
      },
      ["<leader>tv"] = {
         function()
            require("nvterm.terminal").new "vertical"
         end,
         "   new vertical term",
      },
   },
}

M.outline = {

   n = {
      ["<leader>ls"] = { "<cmd> SymbolsOutline <CR>", "   outline view" },
   },
}

M.telescope = {

   n = {
      -- find
      ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "   live grep"},
      ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

      -- git
      ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "שׂ   git commits" },
      ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
      ["<leader>gst"] = { "<cmd> Telescope git_status <CR>", "  git status" },

      -- pick a hidden term
      ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },
   },
}

M.tld = {

   n = {
      ["<leader>td"] = { "<cmd> ToggleDiag <CR>", "𥳐   diagnostics" },
   },
}

M.disabled = {

   n = {
      ["<leader>cm"] = "",
      ["<leader>fw"] = "",
      ["<leader>gt"] = "",
      ["<leader>pt"] = "",
      ["<leader>tk"] = "",
      ["<leader>wK"] = "",
      ["<leader>wa"] = "",
      ["<leader>wr"] = "",
      ["<leader>h"] = "",
      ["<leader>v"] = "",
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
   },

   t = {
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
   },
}

return M
