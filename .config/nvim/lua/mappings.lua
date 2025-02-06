require "nvchad.mappings"

local map = vim.keymap.set
local del = vim.keymap.del

del("n", "<tab>")
del("n", "<S-tab>")
del("n", "<leader>x")
del("n", "<leader>fm")
del("n", "<leader>cm")
del("n", "<leader>ch")

map({"n", "v"}, "<C-y>", "\"+y")
map({"n", "v"}, "<C-p>", "\"+p")

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto next" })

map("n", "<leader>c", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

map("n", "<leader>lf", function()
  require("conform").format()
end, { desc = "format"})
