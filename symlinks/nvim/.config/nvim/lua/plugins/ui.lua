return {
  -- use latte & frappe catppuccin flavours
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
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
      colorscheme = function()
        local mode = vim.fn.system("dark-notify --exit")
        local flavor = string.find(mode, "light") and "latte" or "frappe"
        vim.cmd.colorscheme("catppuccin-" .. flavor)
      end,
    },
  },

  -- automatically switch between light/dark mode
  {
    "cormacrelf/dark-notify",
    config = function()
      require("dark_notify").run({
        schemes = {
          light = "catppuccin-latte",
          dark = "catppuccin-frappe",
        },
      })
    end,
  },

  -- switch nvim windows with awareness of tmux panes
  {
    "aserowy/tmux.nvim",
    keys = {
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        desc = "Move to left window",
      },
      {
        "<C-j>",
        function()
          require("tmux").move_bottom()
        end,
        desc = "Move to lower window",
      },
      {
        "<C-k>",
        function()
          require("tmux").move_top()
        end,
        desc = "Move to upper window",
      },
      {
        "<C-l>",
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
