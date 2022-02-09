local g = vim.g
local cmd = vim.cmd

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

packer.startup {
  function(use)
    -- File explorer
    use {"kyazdani42/nvim-tree.lua"}
    require("nvim-tree").setup{}
    g.nvim_tree_indent_markers = 1
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
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    require("lualine").setup{
        options = {
            section_separators = {"", ""},
            component_separators = {"", ""},
            disabled_filetypes = {"NvimTree"}
        }
    }


    -- Bufferline (emulates tabs in GUI IDEs)
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    require("bufferline").setup {
        options = {
            offsets = { {filetype = "NvimTree", text = "Explorer", adding = 1}}
        }
    }

    -- Syntax Highlighting
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    
    -- Quickly comment/uncomment things
    use {"tpope/vim-commentary"}


    -- Completion engine
    use {"hrsh7th/nvim-cmp", event = "BufRead"}

    
    -- Built-in LSP 
    use {"neovim/nvim-lspconfig"}


    -- LSP manager
    use {"williamboman/nvim-lsp-installer"}


    -- Fuzzy finder
    use {"nvim-telescope/telescope.nvim"}

    require("telescope").setup{
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "   ",
            selection_caret = "  ",
            entry_prefix = "  ",
            path_display = { "shorten" },
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
        }
    }


    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
      }
    }
    require('telescope').load_extension('fzf')

    -- Autopairs
    use {"windwp/nvim-autopairs"}
    require("nvim-autopairs").setup{
        fast_wrap = {
            chars = { "{", "[", "(", '"', "'" }
        }
    }


    -- Indentation
    use {"lukas-reineke/indent-blankline.nvim"}
    vim.g.indent_blankline_buftype_exclude = {
        "nofile",
        "terminal",
        "lsp-installer",
        "lspinfo",
    }
    vim.g.indent_blankline_filetype_exclude = {
        "help",
        "packer",
        "NvimTree",
        "telescope"
    }


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


    use {"mboughaba/i3config.vim"}
    cmd("au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config")
  end
}
