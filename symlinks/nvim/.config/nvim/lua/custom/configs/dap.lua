local dap = require("dap")
local dapui = require("dapui")
local utils = require("custom.utils")

-- setup DAP virtual text
require("nvim-dap-virtual-text").setup()

-- enable virtual text
vim.g.dap_virtual_text = true

-- setup DAP UI
dapui.setup({
   icons = { expanded = "", collapsed = "", current_frame = "" },
})

-- automatically open UI
dap.listeners.after.event_initialized["dapui_config"] = function()
   dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
   dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
   dapui.close()
end

-- beautify icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

-- python
dap.adapters.python = {
   type = "executable",
   command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
   args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
   {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
         return utils.get_python_path(vim.fn.getcwd())
      end,
   },
}

-- lua
dap.adapters.nlua = function(callback, _)
   callback({ type = "server", host = "127.0.0.1", port = 8086 })
end

dap.configurations.lua = {
   {
      type = "nlua",
      request = "attach",
      name = "Attach to running Neovim instance",
   },
}
