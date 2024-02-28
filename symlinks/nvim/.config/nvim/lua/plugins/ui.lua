return {
  -- use latte & frappe catppuccin flavours
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "latte",
      background = {
        light = "latte",
        dark = "frappe",
      },
    },
  },

  -- use catppuccin as default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- automatically switch between light/dark mode
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 500,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
      end,
    },
  },

  -- scroll smoothly
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup({})
    end,
  },

  -- don't set indent scope for leetcode.nvim
  {
    "echasnovski/mini.indentscope",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "leetcode.nvim",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- switch nvim windows with awareness of tmux panes
  {
    "aserowy/tmux.nvim",
    keys = {
      {
        "<M-h>",
        function()
          require("tmux").move_left()
        end,
        desc = "Move to left window",
      },
      {
        "<M-j>",
        function()
          require("tmux").move_bottom()
        end,
        desc = "Move to lower window",
      },
      {
        "<M-k>",
        function()
          require("tmux").move_top()
        end,
        desc = "Move to upper window",
      },
      {
        "<M-l>",
        function()
          require("tmux").move_right()
        end,
        desc = "Move to right window",
      },
    },
    opts = {
      navigation = {
        enable_default_keybindings = false,
      },
      resize = {

        enable_default_keybindings = false,
      },
    },
  },
}
