local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.relativenumber = true
opt.lazyredraw = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.ignorecase = true
opt.undofile = true
opt.foldmethod="marker"
opt.mouse="a"
--g.mapleader = " "

-- Autowrite, this is very useful because when you have edited a file
-- and want to edit another one using :e or move to another buffer,
-- you dont have to write the current one manually every time you switch
-- buffers.
opt.autowriteall = true

-- Show quotes in JSON files because they are usually hidden and
-- it honestly messes up what you are typing/seeing
opt.conceallevel = 0

-- Dont show welcome menu
opt.shortmess:append("sI")

-- Disable tilde on end of buffer
opt.fillchars = {eob = " "}

-- Indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Dont show "INSERT", "VISUAL BLOCK", etc
cmd("set noshowmode")

cmd("colorscheme gruvbox")
