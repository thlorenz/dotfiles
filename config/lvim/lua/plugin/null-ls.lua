-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
local M = {}

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end
-- local formatters = require "lvim.lsp.null-ls.formatters"

M.setup = function()
  -- require 'lspconfig'.tsserver.setup {
  --   on_attach = function(client)
  --     client.resolved_capabilities.document_formatting = false
  --     client.server_capabilities.documentFormattingProvider = false
  --     client.server_capabilities.documentRangeFormattingProvider = false
  --   end,
  -- }

  -- null_ls.setup({
  --   sources = {
  --     null_ls.builtins.formatting.stylua,
  --     null_ls.builtins.formatting.pg_format,
  --     null_ls.builtins.formatting.swiftformat,
  --     null_ls.builtins.formatting.prettier,
  --   }
  -- })
end

return M
