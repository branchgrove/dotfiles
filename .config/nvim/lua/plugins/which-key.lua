return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<Leader>f", group = "[F]ind" },
      { "<Leader>l", group = "[L]sp" },
    })
    require("which-key").setup()
  end
}
