local core_modules = {
  "options",
  "plugins",
  "mappings",
}

for _, module in ipairs(core_modules) do
  local ok, err = pcall(require, module)
  if not ok then
      vim.notify("Failed to load " .. module .. "\n\n" .. err)
  end
end
