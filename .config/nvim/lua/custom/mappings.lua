local map = require("core.utils").map

-- LSP symbols
map("n", "<leader>ls", ":SymbolsOutline <CR>")

-- LSP diagnostics
map("n", "<leader>tlu", ":lua require('toggle_lsp_diagnostics').toggle_underline() <CR>")
map("n", "<leader>tls", ":lua require('toggle_lsp_diagnostics').toggle_signs() <CR>")
map("n", "<leader>tlv", ":lua require('toggle_lsp_diagnostics').toggle_virtual_text() <CR>")
map("n", "<leader>tlp", ":lua require('toggle_lsp_diagnostics').toggle_update_in_insert() <CR>")
map("n", "<leader>tld", ":lua require('toggle_lsp_diagnostics').toggle_diagnostics() <CR>")
