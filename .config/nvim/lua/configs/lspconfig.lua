-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  html = {},
  cssls = {},
  jsonls = {},
  ts_ls = {
    single_file_support = false,
  },
  gopls = {},
}
local nvlsp = require "nvchad.configs.lspconfig"
local map = vim.keymap.set

local on_attach = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)

  map("n", "<leader>lr", function()
    vim.lsp.buf.rename()
  end, { desc = "rename symbol" })
end

-- lsps with default config
for lsp, config in pairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = nvlsp.on_init,
    capabilities = vim.tbl_deep_extend("force", nvlsp.capabilities, config),
  }
end

require("lsp_signature").setup({
  bind = true,
  hint_enable = false,
  hint_prefix = "",
  floating_window = true,
  always_trigger = true,
})
require "diagnostic"
