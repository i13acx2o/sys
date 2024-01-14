-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
  desc = "Highlight on yank",
})

-- Press q to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "checkhealth", "qf", "help", "man", "lspinfo" },
  callback = function()
    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    keymap.set("n", "q", ":close<Return>", opts)
  end,
  desc = "Press q to close",
})

-- Set local indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "css", "lua" },
  callback = function()
    -- Get the current buffer handle (assuming you're inside a function or a context where `vim.api` is available)
    local bufnr = vim.api.nvim_get_current_buf()
    -- Set local options for the current buffer
    vim.api.nvim_buf_set_option(bufnr, "shiftwidth", 2)
    vim.api.nvim_buf_set_option(bufnr, "tabstop", 2)
    vim.api.nvim_buf_set_option(bufnr, "softtabstop", 2)
  end,
  desc = "Set local indentation",
})

-- Set spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "gitcommit" },
  callback = function()
    -- Get the current buffer handle (assuming you're inside a function or a context where `vim.api` is available)
    local bufnr = vim.api.nvim_get_current_buf()
    -- Set local options for the current buffer
    vim.api.nvim_buf_set_option(bufnr, "spell", true)
    vim.api.nvim_buf_set_option(bufnr, "spelllan", "en_us")
  end,
  desc = "Set spell",
})
