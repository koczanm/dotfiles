local HOME = os.getenv("HOME")

-- set dedicated Python virtualenvs for NeoVim
vim.g.python_host_prog = HOME..".pyenv/versions/neovim2/bin/python"
vim.g.python3_host_prog = HOME..".pyenv/versions/neovim3/bin/python"

-- load custom mappings
require "custom.mappings"
