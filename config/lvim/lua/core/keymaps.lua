lvim.leader = "space"
vim.cmd [[
  nnoremap <SPACE> <Nop>
  let mapleader = " "
]]

-- Disable some mappings we don't like
lvim.keys.insert_mode = {
  -- 'jk' for quitting insert mode
  ["jk"] = "<ESC>",
  -- 'kj' for quitting insert mode
  ["kj"] = "<ESC>",
  -- 'jj' for quitting insert mode
  ["jj"] = "<ESC>"
}

lvim.keys.normal_mode = {
  -- Better window movement
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",

  -- Resize with arrows
  ["<C-Up>"] = ":resize -2<CR>",
  ["<C-Down>"] = ":resize +2<CR>",
  ["<C-Left>"] = ":vertical resize -2<CR>",
  ["<C-Right>"] = ":vertical resize +2<CR>",

  -- Tab switch buffer
  ["]]"] = ":BufferLineCycleNext<CR>",
  ["[["] = ":BufferLineCyclePrev<CR>",


  -- QuickFix
  ["]q"] = ":cnext<CR>",
  ["[q"] = ":cprev<CR>",
  ["<C-q>"] = ":call QuickFixToggle()<CR>",

  ["]g"] = vim.diagnostic.goto_next,
  ["N"] = "<cmd>NvimTreeFocus<CR>"

}

lvim.keys.visual_mode = {}
lvim.keys.visual_block_mode = {
  ["K"] = false,
  ["J"] = false,
  ["<A-j>"] = false,
  ["<A-k>"] = false,
}

lvim.keys.command_mode = {
  -- navigate tab completion with <c-j> and <c-k>
  -- runs conditionally
  ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
  ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
}


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
