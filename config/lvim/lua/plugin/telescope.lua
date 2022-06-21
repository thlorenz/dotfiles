-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

lvim.builtin.which_key.mappings["f"] = {
  name = "Find",
  l = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
  F = { "<cmd>Telescope find_files<cr>", "Find File" },
  f = { "<cmd>Telescope git_files<cr>", "Find Git File" },
  r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
}
-- Telescope lsp_document_symbols
lvim.builtin.which_key.mappings["s"] = {
  name = "Search",
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
  H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
  m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
  r = { "<cmd>Telescope registers<cr>", "Registers" },
  s = { "<cmd>Telescope live_grep<cr>", "Text" },
  k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  c = { "<cmd>Telescope commands<cr>", "Commands" },
  o = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
  O = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Symbols" },

  C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
  p = {
    "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
    "Colorscheme with Preview",
  },
}

-- Extensions
lvim.builtin.telescope['extensions'] = {
  fzf = {
    fuzzy = true, -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true, -- override the file sorter
    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
  },
  ["ui-select"] = {
    require("telescope.themes").get_dropdown {
      -- even more opts
    }
  }
}
lvim.builtin.telescope.on_config_done = function(telescope)
  telescope.load_extension("ui-select")
end
