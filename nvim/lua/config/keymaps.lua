local keymap = vim.keymap

-- Disable arrow keys
keymap.set({ "n", "i", "v" }, "<Up>", "")
keymap.set({ "n", "i", "v" }, "<Down>", "")
keymap.set({ "n", "i", "v" }, "<Left>", "")
keymap.set({ "n", "i", "v" }, "<Right>", "")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Indentation
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Select all
keymap.set("n", "<C-a>", "ggVG")

-- Split window
keymap.set("n", "ss", ":split<CR>", { noremap = true, silent = true })
keymap.set("n", "sv", ":vsplit<CR>", { noremap = true, silent = true })

-- Move window
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Copy/Paste system clipboard
keymap.set({ "n", "x" }, "gy", '"+y')
keymap.set("n", "gp", '"+p')
keymap.set("x", "gp", '"+P')

-- J/K improved
keymap.set("n", "j", [[v:count?"j":"gj"]], { noremap = true, expr = true })
keymap.set("n", "k", [[v:count?"k":"gk"]], { noremap = true, expr = true })

-- Open terminal
keymap.set({ "n", "i", "v", "t" }, "<C-q>", ":ToggleTerm name=main<CR>", { noremap = true, silent = true })

-- Diagnostics
keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Diagnostics list" })
keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Diagnostics prev" })
keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Diagnostics Next" })
