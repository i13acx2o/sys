return {
  "nvim-telescope/telescope.nvim",
  version = false,
  cmd = "Telescope",

  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          },
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,

  keys = {
    {
      -- Find files
      ";f",
      function()
        local builtin = require("telescope.builtin")
        builtin.git_files({
          no_ignore = false,
          hidden = true,
        })
      end,
      desc = "Telescope: Files",
    },

    {
      -- Live grep
      ";r",
      function()
        local builtin = require("telescope.builtin")
        builtin.live_grep()
      end,
      desc = "Telescope: Live grep",
    },

    {
      -- List buffers
      "//",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
      desc = "Telescope: Buffers",
    },

    {
      -- Resume last picker
      ";;",
      function()
        local builtin = require("telescope.builtin")
        builtin.resume()
      end,
      desc = "Telescope: Resume",
    },
  },
}
