return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      -- swift = { "swiftlint" },
      -- javascript = { "eslint" },
      -- typescript = { "eslint" },
      -- typescriptreact = { "eslint" },
      -- javascriptreact = { "eslint" },
      -- go = { "golangcilint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end
}
