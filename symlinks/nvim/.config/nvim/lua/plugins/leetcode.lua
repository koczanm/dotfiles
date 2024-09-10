local leet_arg = "leetcode"

return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv()[1],
    opts = {
      arg = leet_arg,
      lang = "python3",
      injector = {
        ["python3"] = {
          before = "from typing import List",
        },
      },
    },
  },
}
