require "nvchad.options"

local opt = vim.opt
opt.title = true
opt.list = true
opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
opt.hlsearch = false -- Highlight text on search (/)
opt.clipboard = ""
