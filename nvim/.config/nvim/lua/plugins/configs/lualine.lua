local present, telescope = pcall(require, "lualine")
if not present then
    return
end

require("lualine").setup{
    options = {
        theme = 'onedark',
        section_separators = {"", ""},
        component_separators = {"", ""},
    }
}
