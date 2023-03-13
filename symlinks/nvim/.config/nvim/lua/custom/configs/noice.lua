local present, noice = pcall(require, "noice")

if not present then
  return
end

noice.setup {
  lsp = {
    progress = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
  },
}
