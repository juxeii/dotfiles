local opt = vim.opt

-- Lines
opt.wrap = false
opt.number = true
opt.relativenumber = true

-- Tabs & spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.shiftround = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Style
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Misc
opt.exrc = true
opt.iskeyword:append("-")
opt.backspace = "indent,eol,start"
opt.clipboard:append("unnamedplus")