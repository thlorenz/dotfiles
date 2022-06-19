lvim.leader = "space"
vim.cmd [[
  nnoremap <SPACE> <Nop>
  let mapleader = " "
]]

lvim.keys.normal_mode["]g"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["N"] = "<cmd>NvimTreeFocus<CR>"

-- Copy file paths
vim.cmd [[
  map <leader>jf :let @+ = expand("%")<CR>
  map <leader>jF :let @+ = expand("%:p")<CR>
]]
-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
