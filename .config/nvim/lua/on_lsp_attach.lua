local helpers = require("helpers")

return function()
  local telescope_builtin = require("telescope.builtin")

  local normal_keymaps = {
    ["K"] = { vim.lsp.buf.hover, desc = "Hover Documentation" },
  }
  local visual_keymaps = {}

  normal_keymaps["<leader>la"] = {
    function()
      vim.lsp.buf.code_action()
    end,
    desc = "LSP code action",
  }
  visual_keymaps["<leader>la"] = normal_keymaps["<leader>la"]

  normal_keymaps["gd"] = {
    function()
      telescope_builtin.lsp_definitions()
    end,
    desc = "[G]o to [D]efinition",
  }

  normal_keymaps["<Leader>lr"] = {
    function()
      vim.lsp.buf.rename()
    end,
    desc = "Rename symbol",
  }

  helpers.map_keys("n", normal_keymaps)
  helpers.map_keys("v", visual_keymaps)
end
