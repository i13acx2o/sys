return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  version = false,
  opts = {
    open_mapping = [[<C-q>]],
    direction = "float",
    float_opts = {
      border = "curved",
      width = 120,
      height = 30,
    },
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
  },
}
