local helpers = require("helpers")

local normal = {
  ["L"] = { function() vim.cmd("bn") end, desc = "Next buffer" },
  ["H"] = { function() vim.cmd("bp") end, desc = "Previous buffer" },
  ["<Leader>c"] = { function() vim.cmd("bd") end, desc = "Close buffer" },
}

helpers.map_keys("n", normal)
