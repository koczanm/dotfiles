local M = {}

-- Path to overriding theme and highlights files
local highlights = require("custom.highlights")

M.ui = {
   hl_override = highlights.override,
   hl_add = highlights.add,
   nvdash = {
      buttons = {
         { "  Find File", "Spc f f", "Telescope find_files" },
         { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
         { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
         { "  Bookmarks", "Spc b m", "Telescope marks" },
         { "  Themes", "Spc t f", "Telescope themes" },
         { "  Mappings", "Spc c h", "NvCheatsheet" },
      },
      load_on_startup = true,
   },
   theme_toggle = { "catppuccin_latte", "catppuccin_frappe" },

   statusline = {
      theme = "vscode_colored",
   },
   extended_integrations = { "dap", "notify", "trouble" },
}

M.plugins = "custom.plugins"

M.mappings = require("custom.mappings")

return M
