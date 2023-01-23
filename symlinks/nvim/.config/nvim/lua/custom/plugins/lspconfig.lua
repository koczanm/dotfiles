local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local utils = require("custom.plugins.utils")

-- Pyright
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = function(client)
		local python_path = utils.get_python_path(client.config.root_dir)
		client.config.settings.python.pythonPath = python_path
	end,
})

-- Sumneko Lua
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

-- other LSP servers
local servers = {
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"rust_analyzer",
	"tsserver",
	"yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
