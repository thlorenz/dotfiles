lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "challenger_deep"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

local o         = vim.opt
o.backup        = false -- creates a backup file
o.clipboard     = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight     = 2 -- more space in the neovim command line for displaying messages
o.colorcolumn   = "99999" -- fixes indentline for now
o.completeopt   = { "menuone", "noselect", "longest" }
o.conceallevel  = 0 -- so that `` is visible in markdown files
o.fileencoding  = "utf-8" -- the encoding written to a file
o.foldmethod    = "manual" -- folding set to "expr" for treesitter based folding
o.foldexpr      = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
o.guifont       = "monospace:h17" -- the font used in graphical neovim applications
o.hidden        = true -- required to keep multiple buffers and open multiple buffers
o.hlsearch      = false -- highlight all matches on previous search pattern
o.ignorecase    = true -- ignore case in search patterns
o.mouse         = "a" -- allow the mouse to be used in neovim
o.pumheight     = 10 -- pop up menu height
o.showmode      = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline   = 0 -- never show tabs
o.smartcase     = true -- smart case
o.smartindent   = true -- make indenting smarter again
o.splitbelow    = true -- force all horizontal splits to go below current window
o.splitright    = true -- force all vertical splits to go to the right of current window
o.swapfile      = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)

o.timeoutlen  = 600 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 600
o.updatetime  = 300

o.title       = true -- set the title of window to the value of the titlestring
o.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
o.undodir     = vim.fn.stdpath "cache" .. "/undo"
o.undofile    = true -- enable persistent undo
o.updatetime  = 300 -- faster completion
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited

o.expandtab   = true -- convert tabs to spaces
o.shiftwidth  = 2 -- the number of spaces inserted for each indentation
o.tabstop     = 2 -- insert 2 spaces for a tab
o.softtabstop = 2
o.wrap        = false -- display lines as one long line

o.guicursor  = "n:blinkwait500-blinkon400-blinkoff250"
o.cursorline = true -- highlight the current line

o.number         = true -- set numbered lines
o.relativenumber = false -- set relative numbered lines
o.numberwidth    = 4 -- set number column width to 2 {default 4}
o.signcolumn     = "yes" -- always show the sign column otherwise it would shift the text each time
o.spell          = false
o.spelllang      = "en"
o.scrolloff      = 8 -- is one of my fav
o.sidescrolloff  = 8

o.shortmess = "atI"
o.whichwrap:append "<,>,[,],h,l"

-- TODO: rewrite as non-vim script

vim.cmd [[
  au FileType rust noremap tr :wa \| ! cargo run<CR>
  au FileType json set tabstop=2 softtabstop=2 shiftwidth=2 tw=120 fo=cqt wm=0

  au FileType javascript noremap tr :wa \| ! DEBUG=* node --trace-deprecation %<CR>
  au FileType typescript noremap tr :wa \| ! esr %<CR>


  au FileType lua noremap tr :wa \| !lua %<CR>

  au FileType dart noremap <leader>m :wa \| !dart %<CR>


  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType python noremap tr :wa \| !python %<CR>
  au FileType python set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

  au FileType make set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType dart set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

  au BufRead,BufNewFile *.md setfiletype markdown
  au FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2 tw=95 fo=cqt wm=0 conceallevel=0 concealcursor=nvc
]]

vim.cmd [[
  " Project specific .vimrc
  let $git_vimrc= expand(system("echo -n $(git rev-parse --show-toplevel)/.vimrc")) 
  if filereadable($git_vimrc) && $git_vimrc != expand("$HOME/.vimrc") 
      source $git_vimrc 
  endif
]]
