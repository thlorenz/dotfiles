-- keymaps
lvim.builtin.which_key.mappings["e"] = nil
lvim.builtin.which_key.mappings["n"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }

-- config
lvim.builtin.nvimtree.setup.view.side                      = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git        = true
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false
