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
g.mapleader = " "

-- Autowrite, this is very useful because when you have edited a file
-- and want to edit another one using :e or move to another buffer,
-- you dont have to write the current one manually every time you switch
-- buffers.
opt.autowriteall = true
-- 
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

-- Colorscheme
opt.background = "dark"
cmd("colorscheme catppuccin")

-- Don't wrap lines
vim.wo.wrap = false


fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

fg_bg("TelescopeBorder", "#1a1826", "#1a1826")
fg_bg("TelescopePromptBorder", "#262638", "#262638")

fg_bg("TelescopePromptNormal", "#d9e0ee", "#262638")
fg_bg("TelescopePromptPrefix", "#f28fad", "#262638")
-- 
bg("TelescopeNormal", "#1a1826")
-- 
fg_bg("TelescopePreviewTitle", "#000000", "#abe9b3")
fg_bg("TelescopePromptTitle", "#000000", "#f28fad")
fg_bg("TelescopeResultsTitle", "#1a1826", "#1a1826")
