local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

opt.relativenumber = true
opt.lazyredraw = true
opt.termguicolors = true
opt.cursorline = true
opt.ignorecase = true
opt.undofile = true
opt.foldmethod="marker"
opt.mouse="a"
g.mapleader = " "

vim.opt.clipboard = "unnamedplus"

--autocmd({ "BufReadPost", "BufNewFile" }, {
--  once = true,
--  callback = function()
--      vim.g.clipboard = {
--        copy = {
--          ["+"] = "xclip -selection clipboard -o",
--          ["*"] = "xclip -selection clipboard -o",
--        },
--        paste = {
--          ["+"] = "xclip -selection clipboard",
--          ["*"] = "xclip -selection clipboard",
--        },
--      }
--
--    vim.opt.clipboard = "unnamedplus"
--  end,
--})

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
cmd("colorscheme idk")

-- Don't wrap lines
-- vim.wo.wrap = false

g.python3_host_prog = "python3"

-- Telescope colors (TODO: need organise this)
fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Scroll up/down
map("n", "J", "<C-e>")
map("n", "K", "<C-y>")

-- Since I have mapped Shift-J or uppercase J to scrolling down,
-- we have to map ctrl-j to join so that we can join two lines
map("n", "<C-J>", ":join<CR>")

-- More intuitive way of...
map("n", "H", "0")    -- going home in normal mode
map("v", "H", "0")    -- going home in visual mode
map("n", "L", "A")    -- going to end of line and appending in normal mode
map("v", "L", "$")    -- going to end of line in visual mode

-- Move up and down visual lines
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true})
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true})

-- Quickly access the vim command line
map("n", ",", ":")

-- Move between splits
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Top/bottom of fold
map("n", "fj", "zo]zk")
map("n", "fk", "zo[zj")

-- Create new file or edit an existing file
map("n", "<C-n>", ":e " .. vim.fn.expand('%:p:h') .. "/")

-- Close current buffer
map("n", "<C-w>", ":bp<CR>:bdelete #<CR>", {silent = true})

-- Turn off highlighting
map("n", "<Esc>", ":noh<CR>", {silent = true})

-- Presistant indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Reload current file
map("n", "<M-r>", ":luafile %<cr>", {silent = true})

-- More sensible undo
-- https://stackoverflow.com/a/4360415/9215267
map("i", "<Space>", "<Space><C-g>u")

vim.o.statusline = ' %{expand("%:t") == "" ? "No Name" : expand("%:t")} %= %l/%L '
vim.cmd('highlight StatusLine guibg=#272727')

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- Embed vim status line into tmux
  use 'vimpostor/vim-tpipeline'
end)



