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
map("n", "j", "gj")
map("n", "k", "gk")

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

-- Go to Nth buffer
map("", "<M-1>", "<CMD>lua require'bufferline'.go_to_buffer(1)<CR>")
map("", "<M-2>", "<CMD>lua require'bufferline'.go_to_buffer(2)<CR>")
map("", "<M-3>", "<CMD>lua require'bufferline'.go_to_buffer(3)<CR>")
map("", "<M-4>", "<CMD>lua require'bufferline'.go_to_buffer(4)<CR>")
map("", "<M-5>", "<CMD>lua require'bufferline'.go_to_buffer(5)<CR>")
map("", "<M-6>", "<CMD>lua require'bufferline'.go_to_buffer(6)<CR>")
map("", "<M-7>", "<CMD>lua require'bufferline'.go_to_buffer(7)<CR>")
map("", "<M-8>", "<CMD>lua require'bufferline'.go_to_buffer(8)<CR>")
map("", "<M-9>", "<CMD>lua require'bufferline'.go_to_buffer(9)<CR>")
map("", "<M-0>", "<CMD>lua require'bufferline'.go_to_buffer(10)<CR>")

-- Move buffer tabs (like moving tabs in web browser)
map("n", "<C-A-l>", ":BufferLineMoveNext<CR>", {silent = true})
map("n", "<C-A-h>", ":BufferLineMovePrev<CR>", {silent = true})

-- Tab completion
map("i", "<Tab>", "<C-n>")
map("i", "<S-Tab>", "<C-p>")

-- Toggle the NvimTree
map("n", "<S-f>", ":NvimTreeToggle<CR>", {silent = true})

-- Turn off highlighting 
map("n", "<Esc>", ":noh<CR>", {silent = true})

-- Open a file through Telescope
map("n", "<C-o>", ":Telescope find_files hidden=true<CR>", {silent = true})

-- Rename a variable throughout the file
map('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('n', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('v', '<leader>rn', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- Presistant indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")
