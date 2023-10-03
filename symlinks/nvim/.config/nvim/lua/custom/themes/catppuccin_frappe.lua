local M = {}

M.base_30 = {
   white = "#c6d0f5",
   darker_black = "#292c3c",
   black = "#303446", --  nvim bg
   black2 = "#373b4d",
   one_bg = "#3f4355", -- real bg of onedark
   one_bg2 = "#45475a",
   one_bg3 = "#505466",
   grey = "#585b70",
   grey_fg = "#626880",
   grey_fg2 = "#676b7d",
   light_grey = "#737994",
   red = "#e78284",
   baby_pink = "#eebebe",
   pink = "#f4b8e4",
   line = "#51576d", -- for lines like vertsplit
   green = "#a6d189",
   vibrant_green = "#a6d189",
   nord_blue = "#99d1db",
   blue = "#8caaee",
   yellow = "#e5c890",
   sun = "#eace96",
   purple = "#ca9ee6",
   dark_purple = "#c7a0dc",
   teal = "#81c8be",
   orange = "#ef9f76",
   cyan = "#99d1db",
   statusline_bg = "#35394b",
   lightbg = "#414559",
   pmenu_bg = "#a6d189",
   folder_bg = "#8caaee",
   lavender = "#babbf1",
}

M.base_16 = {
   base00 = "#303446",
   base01 = "#3A3E50",
   base02 = "#414559",
   base03 = "#51576d",
   base04 = "#2c2b40",
   base05 = "#d1dded",
   base06 = "#deeafa",
   base07 = "#c6d0f5",
   base08 = "#e78284",
   base09 = "#ef9f76",
   base0A = "#e5c890",
   base0B = "#a6d189",
   base0C = "#81c8be",
   base0D = "#8caaee",
   base0E = "#ca9ee6",
   base0F = "#e78284",
}

M.polish_hl = {
   ["@variable"] = { fg = M.base_30.lavender },
   ["@property"] = { fg = M.base_30.teal },
   ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

M = require("base46").override_theme(M, "catppuccin")

return M
