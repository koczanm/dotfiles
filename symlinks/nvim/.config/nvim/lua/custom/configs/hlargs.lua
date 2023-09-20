local hlargs = require("hlargs")
local base16 = require("base46").get_theme_tb("base_16")

hlargs.setup({
   color = base16.base08,
   excluded_argnames = {
      declarations = {
         python = { "self", "cls" },
         lua = { "self" },
      },
      usages = {
         python = { "self", "cls" },
         lua = { "self" },
      },
   },
})
