local M = {}


M.alpha = {
  header = {
    val = {
      "⠀⠀⣼⣀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⠀⠀⠀⠀⣀⣧⠀⠀",
      "⠀⠀⠸⠻⣿⣶⣦⣤⣈⢻⣶⣮⢿⣿⣿⡿⣵⢶⡟⣁⣤⣴⣶⣿⠟⠇⠀⠀",
      "⠀⠀⠀⢪⢦⣙⠻⣿⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣝⣿⠟⣋⡴⡕⠀⠀⠀",
      "⠀⠠⠤⣤⡩⡿⡇⣠⡙⢻⣯⣟⣿⣿⣿⣿⣻⣽⡟⢋⣄⢸⢿⢍⡤⠤⠄⠀",
      "⠀⠀⢀⣀⣤⣶⣽⡿⣿⡮⢭⣬⣽⣯⣽⣯⣥⡭⢵⣿⢿⣯⣶⣤⣀⡀⠀⠀",
      "⠒⠚⠛⠛⠛⠛⠛⠛⠓⠋⠛⢟⢿⣿⣿⡿⣻⠟⠙⠚⠛⠛⠛⠛⠛⠛⠓⠒",
      "⠀⠀⠀⠀⣀⣤⣴⣾⣿⠿⠃⠸⠷⠤⠤⠾⠇⠘⠿⣿⣷⣦⣤⣀⠀⠀⠀⠀",
      "⠀⠀⢀⣼⣿⣿⠿⠋⠁⠀⠀⢸⠧⠠⠄⠼⡇⠀⠀⠈⠙⠿⣿⣿⣧⡀⠀⠀",
      "⠀⣠⣾⠿⠋⠁⠀⣀⣴⡾⠁⢠⠀⠀⠀⠀⡄⠈⢷⣦⣀⠀⠈⠙⠿⣷⣄⠀",
      "⠴⠋⠁⠀⠀⠀⢀⣿⡟⠀⠀⢸⡇⣷⣾⢹⡇⠀⠀⢻⣿⡀⠀⠀⠀⠈⠙⠦",
      "⠀⠀⠀⠀⠀⠀⢸⠏⠀⠀⠀⠀⠁⠛⠛⠈⠀⠀⠀⠀⠹⡇⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠋⠀⠀⠀⠀⠀⢰⣀⣀⡆⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣶⣶⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "TelescopePrompt",
    "TelescopeResult",
    "alpha",
    "help",
    "lspinfo",
    "mason",
    "nvchad_cheatsheet",
    "packer",
    "terminal",
  },
}

M.mason = {
  ensure_installed = {
    -- bash
    "bash-language-server",
    "shellcheck",
    "shfmt",

    -- docker
    "dockerfile-language-server",
    "hadolint",

    -- json
    "json-lsp",
    
    -- lua
    "lua-language-server",
    "stylua",

    -- markdown
    "marksman",

    -- python
    "black",
    "flake8",
    "isort",
    "pyright",

    -- rust
    "rust-analyzer",

    -- yaml
    "actionlint",
    "yaml-language-server",
    
    -- web
    "eslint_d",
    "prettierd",
    "typescript-language-server",
  },
}

M.telescope = {
  defaults = {
    prompt_prefix = "   ",
  }
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "rust",
    "typescript",
    "toml",
    "yaml",
  },
}

return M
