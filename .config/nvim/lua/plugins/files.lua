return {
  "echasnovski/mini.files",
  config = function()
    require("mini.files").setup({})
    vim.keymap.set("n", "<Leader>o", require("mini.files").open, { desc = "Open files" })
  end
}
