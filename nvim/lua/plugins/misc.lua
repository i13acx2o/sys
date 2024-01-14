return {
  {
    -- Highlight colors
    "brenoprata10/nvim-highlight-colors",
    event = "BufReadPre",
    config = true,
  },

  {
    -- Auto Pairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    -- Comment
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    -- Git signs
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = true,
  },

  {
    -- Indentations
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "mason",
          "lazy",
          "toggleterm",
          "NvimTree",
        },
      },
    },
  },

  {
    -- Indent scope
    "echasnovski/mini.indentscope",
    version = false,
    event = "BufReadPre",
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "lazy",
          "mason",
          "toggleterm",
          "NvimTree",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
