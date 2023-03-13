local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local utils = require("custom.utils")

-- List of servers to install
local servers = {
	"bashls",
	"dockerls",
	"jsonls",
	"marksman",
	"pyright",
	"rust_analyzer",
	"tsserver",
	"yamlls",
}

require("mason-lspconfig").setup({
	ensure_installed = servers,
})

require("mason-lspconfig").setup_handlers({
	-- default setup for all servers, unless a custom one is defined below
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		})
	end,

	-- custom setups

	-- lua
	["lua_ls"] = function()
		lspconfig["lua_ls"].setup({
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
	end,

	-- python
	["pyright"] = function()
		lspconfig["pyright"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			on_init = function(client)
				local python_path = utils.get_python_path(client.config.root_dir)
				client.config.settings.python.pythonPath = python_path
			end,
		})
	end,
})
