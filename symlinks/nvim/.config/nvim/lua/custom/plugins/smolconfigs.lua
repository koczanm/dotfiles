local M = {}

M.scroll = function()
  local present, scroll = pcall(require, "neoscroll")

  if not present then
    return
  end

  scroll.setup()
end

M.shade = function()
  local present, shade = pcall(require, "shade")

  if not present then
    return
  end

  shade.setup {
    overlay_opacity = 50,
    opacity_step = 1,
    exclude_filetypes = { "NvimTree" },
  }
end

M.stabilize = function()
  local present, stabilize = pcall(require, "stabilize")

  if not present then
    return
  end

  stabilize.setup()
end

M.symbols = function()
  local present, symbols = pcall(require, "symbols-outline")

  if not present then
    return
  end

  symbols.setup()
end

M.lsp_diag = function()
  local present, lsp_diag = pcall(require, "toggle_lsp_diagnostics")

  if not present then
    return
  end

  lsp_diag.init {
    start_on = false,
  }
end

M.tmux = function()
  local present, tmux = pcall(require, "nvim-tmux-navigation")

  if not present then
    return
  end

  tmux.setup()
end

return M
