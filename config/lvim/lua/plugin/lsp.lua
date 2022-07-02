lvim.builtin.which_key.mappings["l"] = {
  name = "LSP",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  e = { "<cmd>Trouble document_diagnostics<cr>", "Trouble diagnostics" },
  E = { "<cmd>TroubleClose<cr>", "Trouble diagnostics" },
  F = { require("lvim.lsp.utils").format, "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
  j = {
    vim.diagnostic.goto_next,
    "Next Diagnostic",
  },
  k = {
    vim.diagnostic.goto_prev,
    "Prev Diagnostic",
  },
  l = { function() vim.lsp.codelens.refresh(); vim.lsp.codelens.run() end, "CodeLens Action" },
  p = {
    name = "Peek",
    d = { "<cmd>lua require('lvim.lsp.peek').Peek('definition')<cr>", "Definition" },
    t = { "<cmd>lua require('lvim.lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
    i = { "<cmd>lua require('lvim.lsp.peek').Peek('implementation')<cr>", "Implementation" },
  },
  q = { vim.diagnostic.setloclist, "Quickfix" },
  r = { vim.lsp.buf.rename, "Rename" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols", },
  f = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}

lvim.lsp.buffer_mappings = {
  normal_mode = {
    ["K"] = { vim.lsp.buf.hover, "Show hover" },

    ["gr"] = { "<cmd>Telescope lsp_references<CR>", "Goto references" },
    ["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto definition" },
    ["gD"] = { vim.lsp.buf.declaration, "Goto declaration" },
    ["gI"] = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    ["gs"] = { vim.lsp.buf.signature_help, "show signature help" },
    ["gp"] = {
      function()
        require("lvim.lsp.peek").Peek "definition"
      end,
      "Peek definition",
    },
    ["gl"] = {
      function()
        local config = lvim.lsp.diagnostics.float
        config.scope = "line"
        vim.diagnostic.open_float(0, config)
      end,
      "Show line diagnostics",
    },
  },
  insert_mode = {},
  visual_mode = {},
}

-- vim.cmd [[
--  au FileType rust nnoremap <silent> K :RustHoverActions<CR>
-- ]]
