local opt = vim.opt

vim.g.mapleader = " "
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.termguicolors = true
opt.guicursor = ""

opt.hlsearch = false
opt.incsearch = true

opt.updatetime = 50
opt.scrolloff = 8

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

opt.wrap = false
opt.linebreak = true

opt.backup = false
opt.swapfile = false

opt.signcolumn = "yes"
-- opt.colorcolumn = "80"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

opt.confirm = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
