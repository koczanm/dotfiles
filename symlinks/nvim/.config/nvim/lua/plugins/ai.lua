return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      strategies = {
        chat = {
          adapter = "copilot",
          slash_commands = {
            ["buffer"] = {
              opts = {
                provider = "fzf_lua",
              },
            },
            ["file"] = {
              opts = {
                provider = "fzf_lua",
              },
            },
            ["help"] = {
              opts = {
                provider = "fzf_lua",
              },
            },
            ["symbols"] = {
              opts = {
                provider = "fzf_lua",
              },
            },
          },
          keymaps = {
            send = {
              modes = { n = { "<C-s>", "<CR>" }, i = "<C-s>" },
            },
            close = {
              modes = { n = "q", i = "<C-c>" },
            },
          },
        },
        inline = {
          adapter = "copilot",
          keymaps = {
            accept_change = {
              modes = { n = "<space>gha" },
              description = "Accept Hunk (CodeCompanion)",
            },
            reject_change = {
              modes = { n = "<space>ghr" },
              description = "Reject Hunk (CodeCompanion)",
            },
          },
        },
        display = {
          diff = {
            provider = "mini_diff",
          },
        },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Prompt Actions (CodeCompanion)" },
      { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle (CodeCompanion)" },
      { "<leader>ac", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add Code (CodeCompanion)" },
      { "<leader>ai", ":CodeCompanion ", mode = { "n", "v" }, desc = "Inline (CodeCompanion)" },
    },
  },
}
