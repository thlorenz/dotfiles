-- lvim.builtin.which_key.mappings["t"] = {
--   name = "Tabular"
-- }
--
-- local tabular = lvim.builtin.which_key.mappings["t"]
--
-- tabular['=']  = { '<cmd>Tabularize /=<CR>' }
-- tabular[',']  = { '<cmd>Tabularize /,<CR>' }
-- tabular[';']  = { '<cmd>Tabularize /;<CR>' }
-- tabular[':']  = { '<cmd>Tabularize /:<CR>' }
-- tabular['(']  = { '<cmd>Tabularize /(<CR>' }
-- tabular['\\'] = { '<cmd>Tabularize /\\<CR>' }


vim.cmd [[
  noremap <silent> <leader>t=  :Tabularize /=<CR>
  noremap <silent> <leader>t,  :Tabularize /,<CR>
  noremap <silent> <leader>t;  :Tabularize /;<CR>
  noremap <silent> <leader>t:  :Tabularize /:<CR>
  noremap <silent> <leader>t(  :Tabularize /(<CR>
  noremap <silent> <leader>t\  :Tabularize /\<CR>
]]
