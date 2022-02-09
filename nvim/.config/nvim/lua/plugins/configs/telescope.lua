local present, telescope = pcall(require, "telescope")
if not present then
    return
end

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
            file_ignore_patterns = {
                "^%.git/",
                "^node_modules/",
                "^__pycache__/",
                "^%.cache/",
                "^%.local/",
                "^%.vscode-oss/",
                "^%.npm/",
                "^%.android/",
                "^%.ant/",
                "^%.atom/",
                "^%.audacity-data/",
                "^%.autopsy/",
                "^%.bluej/",
                "^%.bluej.Boot$App/",
                "^%.BurpSuite/",
                "^%.cache/",
                "^%.charles/",
                "^%.cmake/",
                "^%.cpan/",
                "^%.eclipse/",
                "^%.fake-sms/",
                "^%.fonts/",
                "^%.ghidra/",
                "^%.gnome/",
                "^%.gnupg/",
                "^%.idapro/",
                "^%.ipynb_checkpoints/",
                "^%.java/",
                "^%.jdks/",
                "^%.minetest/",
                "^%.mitmproxy/",
                "^%.mozilla/",
                "^%.newsboat/",
                "^%.node_modules/",
                "^%.npm/",
                "^%.openshot_qt/",
                "^%.pki/",
                "^%.rustup/",
                "^%.sonic-pi/",
                "^%.ssh/",
                "^%.ssr/",
                "^%.stremio-server/",
                "^%.swt/",
                "^%.vscode-oss/",
                "^%.w3m/",
                "^%.wpscan/",
                "^%.xonotic/",
                "^%.ZAP/",
                "^%.zoom/",
            }
        }
        }

require('telescope').load_extension('fzf')

