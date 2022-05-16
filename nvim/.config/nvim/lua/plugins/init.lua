local g = vim.g
local fn = vim.fn
local cmd = vim.cmd

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

packer.startup {
  function(use)
    -- Package mananger
    use {"wbthomason/packer.nvim"}

    -- File explorer
    use {"kyazdani42/nvim-tree.lua"}
    require("nvim-tree").setup{}
    --g.nvim_tree_indent_markers = 1
    require("nvim-tree.view").View.winopts.cursorline = true

    nvimTreeEnter = function()
      vim.cmd "highlight! Cursor blend=100"
      vim.opt.guicursor = { "n:Cursor/lCursor", "v-c-sm:block", "i-ci-ve:ver25", "r-cr-o:hor2" }
    end

    nvimTreeLeave = function()
      vim.cmd "highlight! Cursor blend=NONE"
      vim.opt.guicursor = { "n-v-c-sm:block", "i-ci-ve:ver25", "r-cr-o:hor20" }
    end


    -- Boost startup time
    use {
      "nathom/filetype.nvim",
      config = function()
        vim.g.did_load_filetypes = 1
      end
    }
    
    
    -- Lua functions
    use {"nvim-lua/plenary.nvim"}


    -- Catppuccin colorscheme
    use {"catppuccin/nvim", as = "catppuccin"}

    
    -- Statusline
    use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
    require("plugins.configs.lualine")


    -- Bufferline (emulates tabs in GUI IDEs)
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    require("plugins.configs.bufferline")


    -- Syntax Highlighting
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    
    -- Quickly comment/uncomment things
    use {"tpope/vim-commentary"}


    -- Completion engine
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/nvim-cmp'}
    require("plugins.configs.cmp")
    
    -- Built-in LSP 
    use {"neovim/nvim-lspconfig"}
    require("plugins.configs.lsp")

    -- LSP manager
    use {"williamboman/nvim-lsp-installer"}

    -- Fuzzy finder
    use {"nvim-telescope/telescope.nvim"}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    require("plugins.configs.telescope")


    -- Autopairs
    use {"windwp/nvim-autopairs"}
    require("plugins.configs.autopairs")


    -- Indentation
    -- use {"lukas-reineke/indent-blankline.nvim"}
    -- require("plugins.configs.indent")


    -- Smooth scrolling
    use {"karb94/neoscroll.nvim"}
    require("neoscroll").setup{}


    -- Markdown preview
    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
    g.mkdp_browser = "qutebrowser"

    
    -- Color highlighter 
    use {"norcalli/nvim-colorizer.lua"}
    require("colorizer").setup()

    
    -- Profile the startup time
    use {"dstein64/vim-startuptime"}


    -- Syntax highlighting for i3 config
    use {"mboughaba/i3config.vim"}
    cmd("au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config")

    use {"L3MON4D3/LuaSnip"}
    require("luasnip.loaders.from_vscode").load()
    use {"rafamadriz/friendly-snippets"}
    use {"onsails/lspkind-nvim"}

    use {"chriskempson/base16-vim"}

    use {"altercation/vim-colors-solarized"}

    use {"folke/zen-mode.nvim"}

  end
}
