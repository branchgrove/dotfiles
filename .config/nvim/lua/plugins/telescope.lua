local helpers = require("helpers")

return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        "^.git/",
        "^node_modules/"
      },
      layout_config = {
        horizontal = { prompt_position = "top", preview_width = 0.55 },
        vertical = { mirror = false },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      sorting_strategy = "ascending",
    },
    pickers = {
      find_files = {
        hidden = true
      },
      live_grep = {
        hidden = true
      },
    },
  },
  config = function(_, opts)
    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    local normal_keymaps = {
      ["<Leader>ff"] = { builtin.find_files, desc = "[F]ind [F]iles" },
      ["<Leader><Leader>"] = { builtin.buffers, desc = "Find open buffers" },
      ["<Leader>fw"] = { builtin.live_grep, desc = "[F]ind [W]ords" },
      ["<Leader>fh"] = { builtin.help_tags, desc = "[F]ind [H]elp" },
      ["<Leader>fn"] = { function() builtin.find_files({ cwd = "~/.config/nvim" }) end, desc = "[F]ind [N]vim files" },
      ["<Leader>fo"] = { function() builtin.live_grep({ grep_open_files = true }) end, desc = "[F]ind [O]pen files" },
      ["<Leader>fd"] = { builtin.diagnostics, desc = "[F]ind [D]iagnostics" },
    }

    opts.defaults.mappings = {
      i = {
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }

    helpers.map_keys("n", normal_keymaps)
    require("telescope").setup(opts)
  end
}
