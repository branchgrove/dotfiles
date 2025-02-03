local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "biome", "prettier" },
    typescript = { "biome", "prettier" },
    javascriptreact = { "biome", "prettier" },
    typescriptreact = { "biome", "prettier" },
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
  default_format_opts = {
    lsp_format = "fallback",
  },
  formatters = {},
}

return options
