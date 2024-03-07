local on_lsp_attach = require("on_lsp_attach")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = on_lsp_attach
})
