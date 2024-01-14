-- Basic options --
-------------------
local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- History
opt.undofile = true
opt.backup = false

-- Swap
opt.swapfile = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Status
opt.showmode = false
opt.cmdheight = 0

-- Search
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.showmatch = true

-- Word wrap
opt.wrap = true

-- Scroll
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Popup
opt.pumblend = 10
opt.pumheight = 10

-- Spaces
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Mouse support
opt.mouse = "a"

-- Colors
opt.termguicolors = true

-- Show chars
opt.list = true
opt.listchars = "tab:>.,eol:↲"

-- Signatures
opt.signcolumn = "yes"

-- Misc
opt.hidden = true
-- opt.lazyredraw = true
opt.virtualedit = "block"
opt.wildignore:append({ "*.pyc", "**/.git/*" })
opt.path:append("**")
opt.shortmess:append("c")
opt.completeopt = { "menu", "menuone", "noselect" }
