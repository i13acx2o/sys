return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufReadPre",
  opts = {
    ensure_installed = {
      "lua",
      "rust",
      "python",
      "bash",
      "go",
    },
    highlight = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
