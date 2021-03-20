source ~/dotfiles/commonvimrc
source ~/.vim/rc/vim-plug.vim


if !empty(glob("~/dotfiles/vim-secretrc"))
  source ~/dotfiles/vim-secretrc
endif

" cn specific
set backupdir=~/.vimtmpdir,.
set directory=~/.vimtmpdir,.
set shell=/bin/bash

" unhighlight search matches
nmap <silent> <leader>u :nohl <CR>
set nohlsearch

" limit "Press Enter or ... to continue"
set shortmess=atI

syn on

inoremap jk <Esc>
inoremap jK <Esc>
inoremap Jk <Esc>
inoremap JK <Esc>
set timeoutlen=800 ttimeoutlen=800


set pastetoggle=<F3>

" Toggle highlight search
noremap <F2> :set hlsearch! hlsearch?<CR>

" Select different color for matching paren highlight
au Bufenter * silent! guibg=darkblue

" Keep small command-line window
set cmdheight=1

" next/prev file with right/left arrow keys
noremap <right> :next <CR>
noremap <left> :prev <CR>

"
" Colors/Themes
"
if has('nvim')
  set termguicolors
  colo challenger_deep
elseif(isGui)
  colo challenger_deep
else
  colo wombat256mod
endif

"
" highlight things that hang over 80th column
"highlight OverLength ctermbg=black ctermfg=white guibg=black
"match OverLength /\%81v.\+/

" or just highlight 81th column
"set colorcolumn=81
"highlight ColorColumn ctermbg=lightblue guibg=lightblue

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" sudo write open file
cmap w!! w !sudo tee % >/dev/null

" Editing and reloading vimrc
nmap <silent> <leader>ev :e ~/.vimrc <CR>
nmap <silent> <leader>ep :e ~/.vim/rc/vim-plug.vim<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Restore cursor position to the last when file was open
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Reload changed JSON files when :set autoread is on
au FocusGained,BufEnter * :checktime

" Font
if (isGui)
  set gfn=SourceCodePro-Regular:h14
elseif(isMac)
  set gfn=SourceCodePro-Regular:h12
else
  set gfn=SourceCodePro-Regular:h14
endif

"Set tab size -- may be overridden for specific filetypes
set tabstop=2
set softtabstop=2
set shiftwidth=2
set	expandtab
set nowrap

" terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h

" cursor
set guicursor=n:blinkwait500-blinkon400-blinkoff250

" Scala specific
au FileType scala noremap <leader><C-r> :wa \| call Send_to_Screen(join(getline(1,'$'), "\n")) \| call Send_to_Screen("\n")<CR>

" Haskell specific
au FileType haskell compiler ghc
au FileType haskell noremap <leader><C-r> :wa \| !runghc %<CR>
au FileType haskell noremap mm        :wa \| !ghc -e :q %<CR>
au FileType haskell noremap <leader>m :wa \| !ghc -e runTests %<CR>


let g:haskell_indent_if = 4
let g:haskell_indent_case = 4

" quick way to get to Hoogle
au FileType haskell nmap __ _?1

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" Yesod specific
au FileType hamlet set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Rust specific
au FileType rust noremap <leader><C-r> :wa \| ! cargo run<CR>

" Perl specific
au FileType perl noremap <leader><C-r> :wa \| ! perl %<CR>

" JSON specific
"au FileType json set tabstop=2 softtabstop=2 shiftwidth=2 tw=120 fo=cqt wm=0 conceallevel=2 concealcursor=nvc
au FileType json set tabstop=2 softtabstop=2 shiftwidth=2 tw=120 fo=cqt wm=0

" JavaScript specific
" au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType javascript noremap <leader>m :wa \| r !(OCAT_COLOR=0 OCAT_DEPTH=0 OCAT_RM=1 node % 2>&1 > /dev/null) <CR>
"noremap <leader>m :wa \| r !(OCAT_COLOR=0 OCAT_DEPTH=0 OCAT_RM=1 ~/dev/ns/nsolid/nsolid-node/out/Release/nsolid % 2>&1 > /dev/null && cat /tmp/ocat.txt) <CR>

au FileType javascript noremap <leader><C-r> :wa \| ! node %<CR>
au FileType typescript noremap <leader><C-r> :wa \| ! ts-node %<CR>
"au FileType javascript noremap <leader><C-r> :wa \| ! DEBUG=* nsolid %<CR>
"au FileType javascript noremap <leader><C-r> :wa \| ! /Users/thlorenz/dev/ns/nsolid/nsolid-node/out/Release/nsolid %<CR>
"au FileType javascript noremap <leader>e :wa \| ! /Users/thlorenz/dev/ns/nsolid/nsolid-node/out/Release/nsolid --debug-brk  %<CR>
"au FileType javascript noremap <leader><C-r> :wa \| ! ./node %<CR>
"au FileType javascript noremap <leader><C-r> :wa \| ! node %<CR>
"au FileType javascript noremap <leader><C-r> :wa \| ! node --allow-natives-syntax %<CR>
"au FileType javascript noremap <leader>m :wa \| !mocha %<CR>
" let g:syntastic_javascript_checkers=['eslint']

" au FileType lua noremap <leader><C-r> :wa \| !/Applications/CoronaSDK/Corona\ Simulator.app/Contents/MacOS/Corona\ Simulator -project %:p -skin iPhone <CR>
au FileType lua noremap <leader><C-r> :wa \| !lua %<CR>

au FileType dart noremap <leader>m :wa \| !dart %<CR>

" npm install --save-dev word under cursor
au FileType javascript nnoremap <leader>I :execute ":!npm install --save-dev " . expand("<cword>")<CR>
" npm install --save word under cursor
au FileType javascript nnoremap <leader>i :execute ":!npm install --save " . expand("<cword>")<CR>

au FileType make set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType dart set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType stylus set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType jade set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType handlebars set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
au FileType yaml set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" CSS specific
au FileType css set omnifunc=csscomplete#CompleteCSS

" Html specific
au FileType html set omnifunc=htmlcomplete#CompleteTags

" JavaScript, C, CSS and all other langs with { == provide closing brace
inoremap {<CR> {<CR>}<C-o>O

" Assembler specific
" au FileType nasm noremap <leader><C-r> :wa \| !nasm -f elf32 -g -F stabs % && ld -melf_i386 -o %:r %:r.o && echo "" && ./%:r && rm -f ./%:r ./%:r.o<CR>
au FileType nasm noremap <leader><C-r> :wa \| make %:r && ./%:r && make clean<CR>

" C, C++ specific
set ut=100000
au FileType c,cc,cpp,h noremap <leader><C-r> :wa \| make! %:r && echo "" && ./%:r && rm ./%:r<CR>
" au FileType c noremap <leader><C-r> :wa \| !cc -Wall -g % -o %:r && ./%:r && rm ./%:r<CR>
" au FileType c,cc,cpp noremap <leader><C-r> :wa \| make! run<CR>
" au FileType c,cc,cpp noremap <leader><C-r> :wa \| make! run-pgrep<CR>
au FileType c,cc,cpp noremap <leader>m :wa \| make test<CR>

" Complete options (disable preview scratch window)
set completeopt=menu,longest

" Python specific
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python noremap <leader><C-r> :wa \| !python %<CR>
au FileType python set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
"
" Java specific
au FileType java noremap mm        :wa \| !javac %:p:h/*.java<CR>

" Turn Menu and toolbar off
set guioptions=-m
set guioptions=-M

" Turn scrollbars off
set guioptions-=r
set guioptions-=b

au FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2 tw=95 fo=cqt wm=0 conceallevel=0 concealcursor=nvc

" Line numbers
nmap <leader>' :set relativenumber!<cr>
nmap <leader>" :set number!<cr>

"strip all trailing whitespace in the current file"
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Automatically remove trailing spaces"
" au FileType c,cpp,java,php,js,py,coffee au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"Enable filtype plugins
filetype plugin on
filetype indent on

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <M-p> :cp <CR>
map <silent> <M-n> :cn <CR>

"Ruby
au FileType ruby,eruby set omnifunc=rubycomplete#Complete
au FileType ruby,eruby comp ruby

au FileType ruby mlet g:rubycomplete_buffer_loading = 1
au FileType ruby mlet g:rubycomplete_classes_in_global = 1

au FileType ruby map <F1> :!ri	<CR>
au FileType ruby map <F3> :!irb<CR>
au FileType ruby noremap <leader><C-r> !ruby %<CR>

" Flex/ActionScript
au FileType actionscript,mxml set omnifunc=actionscriptcomplete#Complete

" CoffeeScript specific
au FileType coffee noremap <leader><C-r> :wa \| ! coffee %<CR>
"Auto Compile CoffeScript on save
if(isGui)
  " Below prevents saving
  let coffee_make_options = "-p"
  au BufWritePost *.coffee silent CoffeeMake -b | cwindow
endif

" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
set novisualbell  " No blinking .
" No noise.
set noerrorbells
set visualbell t_vb=
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Open new terminal shell
noremap <leader>d <C-Z>

" Edit file under cursor even if it doesn't exist
map <leader>gf :e <cfile><cr>

" tmux integration
" read tmux buffer into current file
map <C-p> :r !tmux save-buffer - <CR>

" color column an 100
"hi ColorColumn ctermbg=138 guibg=black
"set colorcolumn=102


set cursorline
noremap <leader><S-j> :set cursorline!<CR>

"Commands
command! -nargs=* Wrap set wrap linebreak nolist

" Copy relative/full path to system clipboard
map <leader>jf :let @+ = expand("%")<CR>
map <leader>jF :let @+ = expand("%:p")<CR>

" Diff current Buffer with original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" Apply Macro to Visual selection
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

nnoremap <S-h> :m .-2<CR>==
nnoremap <S-l> :m .+1<CR>==
vnoremap <S-h> :m '<-2<CR>gv=gv
vnoremap <S-l> :m '>+1<CR>gv=gv

" Paste/Put/Read into Buffer
nnoremap <leader>pdt :pu=strftime('%a %b %d %Y %H:%M:%S')<CR>
nnoremap <leader>pdd :pu=strftime('%a %b %d %Y')<CR>

let g:is_opaque=0
function! ToggleOpacity()
  if g:is_opaque == 1
    let g:is_opaque = 0
    hi! Normal ctermfg=253 ctermbg=233 guifg=#cbe3e7 guibg=#1e1c31
    hi! NonText ctermfg=236 guifg=#565575
  else
    hi! Normal ctermbg=NONE guibg=NONE 
    hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
    let g:is_opaque = 1
  endif
endfunction
nnoremap <leader><S-p> :call ToggleOpacity()<CR>

hi NormalFloat ctermfg=253 ctermbg=133 guifg=#cbe3e7 guibg=#000000


"
" Completing WhichKey Map setup (Turned off, see ./rc/vim-plugin.vim)
" IMPORTANT: This needs to run after all of the mappings were setup
" nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
" vnoremap <silent><leader>       :<c-u>WhichKeyVisual '<Space>'<CR>
