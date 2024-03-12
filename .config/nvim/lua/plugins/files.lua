return {
  "echasnovski/mini.files",
  config = function()
    require("mini.files").setup({
      mappings = {
        go_in_plus = "l",
        go_out_plus = "h"
      }
    })
    vim.keymap.set("n", "<Leader>o", require("mini.files").open, { desc = "Open files" })
  end
}
