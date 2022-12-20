local present, lsp_diag = pcall(require, "toggle_lsp_diagnostics")

if not present then
	return
end

lsp_diag.init({
	start_on = false,
})
