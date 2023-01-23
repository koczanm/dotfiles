local present_dap, dap = pcall(require, "dap")
local present_dapui, dapui = pcall(require, "dapui")
local present_virtual_text, dapvt = pcall(require, "nvim-dap-virtual-text")
local present_osv, osv = pcall(require, "osv")

if not present_dap or not present_dapui or not present_virtual_text or not present_osv then
	return
end

-- UI

local base16 = require("base46").get_theme_tb("base_16")
local colors = require("base46").get_theme_tb("base_30")

-- Setup DAP virtual text
dapvt.setup()

-- Setup DAP UI
dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
})

-- Automatically open UI
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Enable virtual text
vim.g.dap_virtual_text = true

-- Apply colors
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = colors.red })
vim.api.nvim_set_hl(0, "DapStopped", { fg = colors.orange })
vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = colors.one_bg2 })

vim.api.nvim_set_hl(0, "DapUIVariable", { fg = base16.base0E })
vim.api.nvim_set_hl(0, "DapUIScope", { fg = base16.base08 })
vim.api.nvim_set_hl(0, "DapUIType", { fg = base16.base0A })
vim.api.nvim_set_hl(0, "DapUIValue", { fg = colors.grey_fg })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { fg = base16.base0B })
vim.api.nvim_set_hl(0, "DapUIDecoration", { fg = base16.base0F })
vim.api.nvim_set_hl(0, "DapUIThread", { fg = base16.base0F })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { fg = base16.base08 })
vim.api.nvim_set_hl(0, "DapUIFrameName", { fg = base16.base0E })
vim.api.nvim_set_hl(0, "DapUICurrentFrameName", { fg = base16.base09 })
vim.api.nvim_set_hl(0, "DapUISource", { fg = colors.grey_fg })
vim.api.nvim_set_hl(0, "DapUILineNumber", { fg = colors.grey_fg })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = colors.grey_fg })
vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { fg = base16.base0F })
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { fg = base16.base0F })
vim.api.nvim_set_hl(0, "DapUIWatchesError", { fg = colors.base0F })
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { fg = base16.base08 })
vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { fg = colors.red })
vim.api.nvim_set_hl(0, "DapUIBreakpointsLine", { fg = colors.grey_fg })
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = base16.base09 })
vim.api.nvim_set_hl(0, "DapUIBreakpointsDisabledLine", { fg = colors.red })

-- Beautify icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

-- ADAPTERS & CONFIGS

local lspconfig = require("lspconfig")

-- Python
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
			return lspconfig.pyright.document_config.default_config.settings.python.pythonPath
		end,
	},
}

-- Lua
dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

dap.configurations.lua = {
	{
		type = "nlua",
		request = "attach",
		name = "Attach to running Neovim instance",
    host = "127.0.0.1",
    port = function()
      local value = tonumber(vim.fn.input("Port: "))
      return val
    end,
	},
}
