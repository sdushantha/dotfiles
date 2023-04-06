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

    -- Statusline
    use {"nvim-lualine/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
    require("plugins.configs.lualine")

    -- Bufferline (emulates tabs in GUI IDEs)
    use {"akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons"}
    require("plugins.configs.bufferline")

    -- Syntax highlighting for i3 config
    use {"mboughaba/i3config.vim"}
    cmd("au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config")

    -- Highlight/colorize hexcolors
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require "colorizer".setup()
      end
    }
  end
}
