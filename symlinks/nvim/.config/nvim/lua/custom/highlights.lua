-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
   Comment = {
      italic = true,
   },
   DapBreakpoint = {
      fg = "red",
   },
   DapStopped = {
      fg = "orange",
   },
   DapStoppedLine = {
      bg = "one_bg2",
   },
   DapUIVariable = {
      fg = "baby_pink",
   },
   DapUIValue = {
      fg = "grey_fg",
   },
   DapUIModifiedValue = {
      fg = "yellow",
   },
}

M.add = {}

return M
