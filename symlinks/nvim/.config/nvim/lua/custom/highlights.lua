-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
   Comment = {
      italic = true,
   },
}

M.add = {
   ModesCopy = { bg = "yellow" },
   ModesDelete = { bg = "red" },
   ModesInsert = { bg = "dark_purple" },
   ModesVisual = { bg = "cyan" },
}

return M
