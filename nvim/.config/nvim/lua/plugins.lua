local g = vim.g
local cmd = vim.cmd

return require('packer').startup(
    function()
        use "Pocco81/TrueZen.nvim"
        use "lilydjwg/colorizer"
        
        use "morhetz/gruvbox"
        g.gruvbox_contrast_dark = "hard"

        use "mboughaba/i3config.vim"
        cmd("au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config")

        use "lukas-reineke/indent-blankline.nvim"
        require("indent_blankline").setup {
            char = "|",
            buftype_exclude = {"terminal"},
            filetype_exclude = {"NvimTree"}
        }

        use {
            "hoob3rt/lualine.nvim",
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        require('lualine').setup{
            options = {
                theme = 'gruvbox',
                section_separators = {'', ''},
                component_separators = {'', ''}
            }
        }


        use "neovim/nvim-lspconfig"
        g.lsp_diagnostics_enabled = 0
        require'lspconfig'.pyright.setup{}

        use "hrsh7th/nvim-compe"
        require'compe'.setup {
            enabled = true;
            autocomplete = true;
            debug = false;
            min_length = 1;
            preselect = 'enable';
            throttle_time = 80;
            source_timeout = 200;
            resolve_timeout = 800;
            incomplete_delay = 400;
            max_abbr_width = 100;
            max_kind_width = 100;
            max_menu_width = 100;
            documentation = {
                border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
                winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                max_width = 120,
                min_width = 60,
                max_height = math.floor(vim.o.lines * 0.3),
                min_height = 1,
            };

            source = {
                path = true;
                buffer = true;
                calc = true;
                nvim_lsp = true;
                nvim_lua = true;
                vsnip = true;
                ultisnips = true;
                luasnip = true;
            };
        }
        
        use "onsails/lspkind-nvim"
        require('lspkind').init({
            -- enables text annotations
            --
            -- default: true
            with_text = true,

            -- default symbol map
            -- can be either 'default' or
            -- 'codicons' for codicon preset (requires vscode-codicons font installed)
            --
            -- default: 'default'
            preset = 'codicons',

            -- override preset symbols
            --
            -- default: {}
            symbol_map = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = ""
            },
        })

        --use {
        --  'noib3/cokeline.nvim',
        --  requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
        --}
        --require('cokeline').setup({})

        use {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'}
        require("bufferline").setup{
            options = {
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                    }
                }
            }
        }

        use {
          'nvim-telescope/telescope.nvim',
          requires = { {'nvim-lua/plenary.nvim'} }
        }

        use "kyazdani42/nvim-tree.lua"
        g.nvim_tree_icons = {
            default = "",
            symlink = "",
            git = {
                unstaged = "",
                staged = "",
                unmerged = "",
                renamed = "",
                untracked = "",
                deleted = "",
                ignored = ""
            },
            folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = ""
            }
        }

        vim.g.nvim_tree_root_folder_modifier = ":t"

    end
)
