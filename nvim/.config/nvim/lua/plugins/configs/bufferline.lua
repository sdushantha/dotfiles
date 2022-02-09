local present, telescope = pcall(require, "bufferline")
if not present then
    return
end

require("bufferline").setup {
    options = {
        offsets = { {filetype = "NvimTree", text = "Explorer", adding = 1}}
    }
}
