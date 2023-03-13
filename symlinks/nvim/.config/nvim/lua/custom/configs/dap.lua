local dap = require "dap"
local dapui = require "dapui"
local lspconfig = require "lspconfig"

-- setup DAP virtual text
require("nvim-dap-virtual-text").setup()

-- enable virtual text
vim.g.dap_virtual_text = true

-- setup DAP UI
dapui.setup {
  icons = { expanded = "", collapsed = "", current_frame = "" },
}

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

-- List of adapters to install
local adapters = {
  "bash",
  "python",
}

require("mason-nvim-dap").setup {
  ensure_installed = adapters,
  automatic_setup = true,
}

require("mason-nvim-dap").setup_handlers {
  -- default setup for all adapters, unless a custom one is defined below
  function(source_name)
    require "mason-nvim-dap.automatic_setup"(source_name)
  end,

  -- custom setups
  python = function()
    dap.adapters.python = {
      type = "executable",
      command = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return lspconfig.pyright.document_config.default_config.settings.python.pythonPath
        end,
      },
    }
  end,
}
