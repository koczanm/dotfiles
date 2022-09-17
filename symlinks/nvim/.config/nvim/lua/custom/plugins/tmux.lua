local present, tmux = pcall(require, "nvim-tmux-navigation")

if not present then
  return
end

tmux.setup {}
