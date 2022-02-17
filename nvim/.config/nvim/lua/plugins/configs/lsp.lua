local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = {}

lspconfig.sumneko_lua.setup{}

lspconfig.pyright.setup{
    capabilities = capabilities,
    flags = flags,
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = function(startpath)
        return vim.fn.getcwd() 
    end,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    single_file_support = true
}


lspconfig.vdmj.setup{}

lspconfig.gopls.setup{
  cmd = {"gopls"},
  capabilities = capabilities,
  flags = flags,
  root_dir = function()
    return vim.fn.getcwd()
  end
}

lspconfig.bashls.setup{
    cmd = { "bash-language-server", "start" },
    cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
    },
    filetypes = { "sh" },
    root_dir = function()
        return vim.fn.getcwd()
    end,
    single_file_support = true
}

-- Disable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
