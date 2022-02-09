local present, telescope = pcall(require, "indent-blankline")
if not present then
    return
end

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
