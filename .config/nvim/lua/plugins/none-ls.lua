return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local builtins = require("null-ls.builtins")

    local sources = {
      builtins.formatting.biome.with({
        condition = function(utils)
          return utils.root_has_file("biome.json", "rome.json")
        end,
      }),
      builtins.formatting.stylua,
      builtins.diagnostics.actionlint,
    }

    require("null-ls").setup({
      sources = sources,
      on_attach = require("on_lsp_attach")
    })
  end
}
