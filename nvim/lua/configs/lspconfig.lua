require("nvchad.configs.lspconfig").defaults()



-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "eslint", "jsonls" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  if vim.lsp.config then
    vim.lsp.config(lsp, {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    })
    vim.lsp.enable(lsp)
  else
    require("lspconfig")[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end
end
