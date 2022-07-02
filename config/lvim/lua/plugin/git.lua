require('plugin.dispatch')

lvim.builtin.which_key.mappings["g"] = {
  name = "Git",
  j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
  k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
  L = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
  l = { "<cmd>call TmuxWindowCmd('fugitive', 'FORCE_COLOR=0 nvim -c :Gclog')<cr>", "Git log" },
  P = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
  p = { "<cmd>Git push<CR>", "Git push" },
  r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
  R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
  S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
  s = { "<cmd>call TmuxWindowCmd('fugitive', 'FORCE_COLOR=0 nvim -c :Git -c 20wincmd_')<CR>", "Git status" },
  u = {
    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
    "Undo Stage Hunk",
  },
  -- o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
  o = { "<cmd>Dispatch! gh repo view --web --branch $(git branch --show-current)<CR>", "Github Repo View" },
  O = { "<cmd>Dispatch! gh browse --branch $(git branch --show-current) %)<CR>", "Github Repo View File" },
  b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
  c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
  C = {
    "<cmd>Telescope git_bcommits<cr>",
    "Checkout commit(for current file)",
  },
  d = {
    "<cmd>Gitsigns diffthis HEAD<cr>",
    "Git Diff",
  },
}
