return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      },
      window = {
        completion = {
          border = "rounded",
          zindex = 1000,
        },
        documentation = {
          border = "rounded",
          zindex = 1000,
        },
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      },
      mapping = {
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
    })
  end
}
