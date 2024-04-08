return {
    "stevearc/conform.nvim",
    config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { { "biome", "prettier" } },
        templ = { "templ" },
        go = { "gofmt" },
        terraform = { "terraform_fmt" },
        sh = { "shfmt" }
      },
      lsp_fallback = false,
    })

  vim.keymap.set("n", "<Leader>lf", require("conform").format, { desc = "Format document" })
  end
}
