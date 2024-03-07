return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.register({
      ["<Leader>f"] = {
        name = "[F]ind"
      },
      ["<Leader>l"] = {
        name = "[L]sp"
      }
    })
    require("which-key").setup()
  end
}
