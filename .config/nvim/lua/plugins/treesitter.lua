return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = "all",
    highlight = {
      enable = true,
      disable = function(_, bufnr) return vim.b[bufnr].large_buf end,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
  },
  config = function(plugin, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
