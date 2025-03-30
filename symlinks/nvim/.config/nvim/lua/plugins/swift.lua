return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
        exclude = { "swift", "objc", "objcpp", "c", "cpp" },
      },
    },
  },

  -- add syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "swift" } },
  },

  -- install tools
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "swiftlint" } },
  },

  -- add language server
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {},
      },
    },
  },

  -- add linting
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        swift = { "swiftlint" },
      },
    },
  },

  -- add formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        swift = { "swiftformat" },
      },
    },
  },

  --
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "folke/snacks.nvim",
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {},
  },
}
