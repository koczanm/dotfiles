local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local on_init = require("plugins.configs.lspconfig").on_init

local lspconfig = require("lspconfig")
local utils = require("custom.plugins.utils")

-- Pyright
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	on_init = function(client)
		local python_path = utils.get_python_path(client.config)
		client.config.settings.python.pythonPath = python_path
	end,
})

-- other LSP servers
local servers = {
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"rust_analyzer",
	"sumneko_lua",
	"tsserver",
	"yamlls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
