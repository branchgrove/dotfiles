return {
    "stevearc/conform.nvim",
    config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { { "biome", "prettier" } },
      },
    })

  vim.keymap.set("n", "<Leader>lf", require("conform").format, { desc = "Format document" })
  end
}
