local present, telescope = pcall(require, "nvim-autopairs")
if not present then
    return
end

require("nvim-autopairs").setup{
    fast_wrap = {
        chars = { "{", "[", "(", '"', "'" }
    }
}
