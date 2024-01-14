return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufReadPre",

  opts = {
    options = {
      theme = "catppuccin",
      component_separators = { "|", "|" },
      section_separators = { "" },
    },
    sections = {
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "filetype" },
    },
  },
}
