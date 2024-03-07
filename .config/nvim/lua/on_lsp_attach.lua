local helpers = require("helpers")
local disabled_formatters = require("disabled_formatters")

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

  normal_keymaps["<Leader>lf"] = {
    function()
      vim.lsp.buf.format({
        filter = function(client)
          for _, value in ipairs(disabled_formatters) do
            if value == client.name then
              return false
            end
          end

          return true
        end
      })
    end,
    desc = "Format document",
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
