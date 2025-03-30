return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    dependencies = {
      "stevearc/dressing.nvim",
      "ibhagwan/fzf-lua",
    },
    opts = {
      provider = "openrouter",
      vendors = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "google/gemini-2.0-flash-001",
        },
      },
      file_selector = {
        provider = "fzf",
        provider_opts = {},
      },
      highlights = {
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
    },
    build = "make",
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      actions = {
        files = {
          true,
          ["ctrl-g"] = {
            function(_, opts)
              local o = vim.tbl_deep_extend("keep", { resume = true }, opts.__call_opts)
              opts.__call_fn(o)
            end,
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    lazy = true,
    dependencies = {
      {
        "saghen/blink.compat",
        lazy = true,
        opts = {},
        config = function()
          require("cmp").ConfirmBehavior = {
            Insert = "insert",
            Replace = "replace",
          }
        end,
      },
    },
    opts = {
      completion = {
        accept = {
          dot_repeat = false,
        },
      },
      sources = {
        default = { "avante_commands", "avante_mentions", "avante_files" },
        compat = {
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        providers = {
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90,
            opts = {},
          },
          avante_files = {
            name = "avante_files",
            module = "blink.compat.source",
            score_offset = 100,
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000,
            opts = {},
          },
        },
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    ft = function(_, ft)
      vim.list_extend(ft, { "Avante" })
    end,
    opts = function(_, opts)
      opts.file_types = vim.list_extend(opts.file_types or {}, { "Avante" })
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai" },
      },
    },
  },
}
