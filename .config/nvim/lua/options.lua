local helpers = require("./helpers")

local opt = {
  number = true, -- Set line numbers
  mouse = "a", -- Enable mouse mode
  showmode = false, -- Don't show the current mode
  breakindent = true, -- Enable break indent
  undofile = true, -- Save undo history
  ignorecase = true, -- Case-insensitive search
  smartcase = true, -- unless capital in search
  signcolumn = "yes", -- Signcolumn left of line numbers
  updatetime = 250, -- Decrease update time
  timeoutlen = 300,
  splitright = true, -- Split window to right
  splitbelow = true, -- Split window to bottom
  list = true, -- Show certain invisible chracters
  listchars = { tab = '» ', trail = '·', nbsp = '␣' }, -- How invisible characters should be displayed
  scrolloff = 10, -- Minimal number of lines to keep above and below the cursor
  hlsearch = false, -- Highlight text on search
  cmdheight = 0, -- Hide command line unless needed
  completeopt = { "menu", "menuone", "noselect" }, -- Options for insert mode completion
  copyindent = true, -- Use previous indentation when autoindenting
  cursorline = true, -- Highlight current line that the cursor is on
  fillchars = { eob = " " }, -- Disable "~" on nonexistent lines
  pumheight = 10, -- Number of lines in popup menus
  termguicolors = true, -- Enable 24-bit RGB colors in TUI
  title = true, -- Set terminal title to filename and path
  writebackup = false, -- Disable writing backup files before overwriting a file
}

local g = {
  mapleader = " ", -- Set leader key
  maplocalleader = " ", -- Set local leader key
}

helpers.merge_tables(vim.opt, opt)
helpers.merge_tables(vim.g, g)
