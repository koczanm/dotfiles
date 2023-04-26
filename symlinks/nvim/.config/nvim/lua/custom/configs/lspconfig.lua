local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local utils = require("custom.utils")

-- python
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},
	on_init = function(client)
		local python_path = utils.get_python_path(client.config.root_dir)
		client.config.settings.python.pythonPath = python_path
	end,
})

-- lua
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
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
