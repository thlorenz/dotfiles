lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "challenger_deep"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

local o         = vim.opt
o.clipboard     = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight     = 1
o.colorcolumn   = "99999" -- fixes indentline for now
o.completeopt   = { "menuone", "noselect", "longest" }
o.conceallevel  = 0 -- so that `` is visible in markdown files
o.fileencoding  = "utf-8" -- the encoding written to a file
o.foldmethod    = "manual" -- folding set to "expr" for treesitter based folding
o.foldexpr      = "" -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
o.guifont       = "SourceCodePro-Regular:h12" -- the font used in graphical neovim applications
o.hlsearch      = false -- highlight all matches on previous search pattern
o.mouse         = "a" -- allow the mouse to be used in neovim
o.pumheight     = 10 -- pop up menu height
o.showmode      = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline   = 0 -- never show tabs
o.smartindent   = true -- make indenting smarter again
o.splitbelow    = true -- force all horizontal splits to go below current window
o.splitright    = true -- force all vertical splits to go to the right of current window
o.termguicolors = true -- set term gui colors (most terminals support this)

o.virtualedit = nil

o.timeoutlen  = 600 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 600
o.updatetime  = 300

o.title       = true -- set the title of window to the value of the titlestring
o.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
o.undodir     = vim.fn.stdpath "cache" .. "/undo"
o.undofile    = true -- enable persistent undo
o.updatetime  = 300 -- faster completion

o.backup      = false -- creates a backup file
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
o.swapfile    = false -- creates a swapfile

o.autoindent = true
o.copyindent = true

o.showmatch  = true
o.shiftround = true
o.ruler      = true
o.smartcase  = true -- smart case

o.incsearch  = true
o.ignorecase = true -- ignore case in search patterns

o.hidden = true -- required to keep multiple buffers and open multiple buffers

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

o.scrolloff     = 4 -- is one of my fav
o.sidescrolloff = 4

o.wildmenu = true
o.wildmode = "list:longest"
o.wildignore:append "*/src-old/*,*/dist/*,*/docs/*,*/.git/*,*/.svn/*,*/node_modules/*,*.o,*.obj,*.hi,*.sqlite3"


o.shortmess:append "a"
o.shortmess:append "t" --	truncate file message
o.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
o.shortmess:append "I" -- don't show the default intro message
o.whichwrap:append "<,>,[,],h,l"

-- TODO: rewrite as non-vim script

lvim.builtin.which_key.mappings["b"] = nil
vim.cmd [[
  au FileType rust noremap tr :wa \| ! cargo run<CR>
  au FileType json set tabstop=2 softtabstop=2 shiftwidth=2 tw=120 fo=cqt wm=0


  au BufRead,BufNewFile package.json,*.ts,*.js set makeprg=yarn
  au FileType javascript noremap tr :wa \| ! DEBUG=* node --trace-deprecation %<CR>
  au FileType typescript noremap tr :wa \| ! esr %<CR>
  au FileType typescript nmap <silent><leader>bb :wa \| Make build<CR>
  au FileType typescript nmap <silent><leader>bt :wa \| Make test<CR>


  au BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
  au FileType rust nmap <silent><leader>bb :wa \| Make check --all-targets --all-features<CR>
  au FileType rust nmap <silent><leader>bB :wa \| Make build-bpf<CR>

  au FileType lua noremap tr :wa \| luafile %<CR>

  au FileType dart noremap <leader>m :wa \| !dart %<CR>

  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType python noremap tr :wa \| !python %<CR>

  au BufRead,BufNewFile *.md setfiletype markdown

  au FileType python set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType make set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType dart set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2 tw=95 fo=cqt wm=0 conceallevel=0 concealcursor=nvc
]]

vim.cmd [[
  " Project specific .vimrc
  let $git_vimrc= expand(system("echo -n $(git rev-parse --show-toplevel)/.vimrc")) 
  if filereadable($git_vimrc) && $git_vimrc != expand("$HOME/.vimrc") 
      source $git_vimrc 
  endif
]]
