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

-- Move line or selection up/down
vim.cmd [[
  nnoremap <S-h> :m .-2<CR>==
  nnoremap <S-l> :m .+1<CR>==
  vnoremap <S-h> :m '<-2<CR>gv=gv
  vnoremap <S-l> :m '>+1<CR>gv=gv
]]

-- TODO: add without vim script if possible
vim.cmd [[
" strip all trailing whitespace in the current file"
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Open new terminal shell
noremap <leader>d <C-Z>

" Paste/Put/Read into Buffer
nnoremap <leader>pdt :pu=strftime('%a %b %d %Y %H:%M:%S')<CR>
nnoremap <leader>pdd :pu=strftime('%a %b %d %Y')<CR>
]]
-- keymappings [view all the defaults by pressing <leader>Lk]
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )
