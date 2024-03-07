return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "ray-x/lsp_signature.nvim",
  },
  config = function()
    local servers = require("lsp.config")

    require("mason").setup()
    require("mason-lspconfig").setup()

    local ensure_installed = vim.tbl_keys(servers)
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })


    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- Auto registers all installed mason LSPs
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- Sets the overriden capabilities from the server table
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end
      }
    })

    require("lsp_signature").setup({
      bind = true,
      hint_enable = false,
      hint_prefix = "",
      floating_window = true,
      always_trigger = true,
      handler_opts = {
        border = "rounded"
      },
    })
  end
}
