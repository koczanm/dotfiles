local M = {}

M.treesitter = {
   ensured_installed = {
      'bash',
      'dockerfile',
      'javascript',
      'json',
      'lua',
      'make',
      'python',
      'toml',
      'typescript',
      'yaml',
   }
}

M.telescope = {
  defaults = {
     prompt_prefix = "   ",
  }
}

return M