local present, telescope = pcall(require, "lualine")
if not present then
    return
end

require("lualine").setup{
    options = {
        section_separators = {"", ""},
        component_separators = {"", ""},
        disabled_filetypes = {"NvimTree"}
    }
}
