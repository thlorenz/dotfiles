lvim.leader = "space"

lvim.keys.normal_mode["]g"] = vim.diagnostic.goto_next
lvim.keys.normal_mode["N"] = "<cmd>NvimTreeFocus<CR>"

-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
