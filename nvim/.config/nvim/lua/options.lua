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

-- Telescope colors (TODO: need organise this)
fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

fg_bg("TelescopeBorder", "#192022", "#192022")
fg_bg("TelescopePromptBorder", "#202729", "#202729")
fg_bg("TelescopePromptNormal", "#c5c8c9", "#202729")
fg_bg("TelescopePromptPrefix", "#c5c8c9", "#202729")
fg_bg("TelescopePreviewBorder", "#192022", "#192022")
bg("TelescopeNormal", "#192022")
bg("TelescopePreviewNormal", "#192022")
fg_bg("TelescopePreviewTitle", "#192022", "#192022")
fg_bg("TelescopePromptTitle", "#202729", "#202729")
fg_bg("TelescopeResultsTitle", "#192022", "#192022")
