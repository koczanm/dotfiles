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
    opts = {
      update_interval = 500,
      set_dark_mode = function()
        vim.api.nvim_set_option("background", "dark")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option("background", "light")
      end,
    },
  },

  --
  {
    "folke/flash.nvim",
    opts = { vscode = false },
  },

  --
  {
    "lukas-reineke/headlines.nvim",
    opts = {
      markdown = {
        fat_headline_lower_string = "▔",
        fat_headline_upper_string = "▔",
      },
    },
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
