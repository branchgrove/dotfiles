local bg_color = "#1e2127"

return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    colors = {
      bg = bg_color,
      menu = bg_color,
    },
    highlights = {
      NormalFloat = { bg = bg_color },
      FloatBorder = { bg = bg_color },
      TelescopeNormal = { bg = bg_color },
      TelescopeBorder = { bg = bg_color },
      CmpDocumentation = { bg = bg_color },
      CmpDocumentationBorder = { bg = bg_color },
      Pmenu = { bg = bg_color },
      WhichKeyFloat = { bg = bg_color },
      WhichKeyBorder = { bg = bg_color }
    },
  },
  config = function(_, opts)
    require("onedarkpro").setup(opts)
    vim.cmd.colorscheme("onedark")
  end
}
