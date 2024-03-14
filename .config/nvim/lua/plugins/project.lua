return {
  "ahmedkhalf/project.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({
      patterns = { ".git" },
      manual_mode = true,
    })
    require("telescope").load_extension("projects")
    vim.keymap.set("n", "<Leader>fp", require("telescope").extensions.projects.projects, { desc = "[F]ind [P]rojects" })
  end
}
