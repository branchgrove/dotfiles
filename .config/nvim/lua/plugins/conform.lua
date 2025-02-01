return {
    "stevearc/conform.nvim",
    config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { { "biome", "prettier" } },
        typescript = { { "biome", "prettier" } },
        javascriptreact = { { "biome", "prettier" } },
        typescriptreact = { { "biome", "prettier" } },
        templ = { "templ" },
        go = { "gofumpt" },
        terraform = { "terraform_fmt" },
        sh = { "shfmt" },
        python = { "ruff" },
        xml = { "xmlformat" },
        markdown = { "deno_fmt" },
        json = { "fixjson" },
        swift = { "swift_format" },
      },
      lsp_fallback = false,
    })

  vim.keymap.set("n", "<Leader>lf", require("conform").format, { desc = "Format document" })
  end
}
