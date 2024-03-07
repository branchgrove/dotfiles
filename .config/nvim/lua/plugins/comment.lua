return {
  "numToStr/Comment.nvim",
  lazy = false,
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
  config = function (plugin, opts)
    require("Comment").setup(opts)
    local comment = require("Comment.api")

    vim.keymap.set(
      "n",
      "<Leader>/",
      function() comment.toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      { desc = "Toggle comment line", }
    )

    vim.keymap.set(
      "v",
      "<Leader>/",
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      { desc = "Toggle comment for selection" }
    )
  end
}
