return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufRead",
  opts = {
    actions = {
      open_file = { quit_on_open = true },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    git = {
      enable = false,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "NvimTreeToggle" }
  }
,
}
