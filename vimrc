" Detect Environment
  let isGui  = has("gui_running")
  let isUnix = has("unix")
  let isMac  = has("mac")

filetype off
call pathogen#infect()
call pathogen#helptags()

" lots of those come from http://nvie.com/posts/how-i-boosted-my-vim/
set nocompatible     
set virtualedit=

set nobackup
set nowritebackup
set noswapfile

set autoindent
set copyindent

set showmatch
set shiftround
set ruler
set scrolloff=4
set incsearch 
set ignorecase
set backspace=2         
set nu
set hidden
set mouse=a

syn on 

inoremap jk <Esc>

let mapleader=","

" Toggle highlight search
noremap <F2> :set hlsearch! hlsearch?<CR>

" Select different color for matching paren highlight
au Bufenter * silent! guibg=darkblue

" Keep small command-line window
set cmdheight=1

noremap <Space> A
imap <S-Space> <Esc>A

if(isGui) 
  colo wombat
else
  colo wombat256mod
endif

set statusline=%f%m%r%h%w%<\ %{&ff}\ %Y\ %{fugitive#statusline()}\ %=%l/%L,%v\ %p%%

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" sudo write open file
cmap w!! w !sudo tee % >/dev/null

" Editing and reloading vimrc
  nmap <silent> <leader>ev :e $MYVIMRC <CR>
  nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Restore cursor position to the last when file was open
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  
" Font 
  if(isMac)
    set gfn=Monaco:h16
  else
    set gfn=Courier:h16
  endif

" Tagbar
  map <silent> « :TagbarToggle<CR>
  "
" Tabularize (format)
  noremap <silent> <leader>f=	  :Tabularize /= <CR>
  noremap <silent> <leader>f,	  :Tabularize /, <CR>
	noremap <silent> <leader>f:	  :Tabularize /: <CR>

"Set tab size -- may be overridden for specific filetypes
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
	set	expandtab
  set nowrap

" Haskell specific
  au FileType haskell compiler ghc
  au FileType haskell noremap <leader>r :wa \| !runghc %<CR>
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

" JavaScript specific
  au FileType javascript noremap <leader>r :wa \| !export NODE_PATH="/Users/thlorenz/dev/lab49/Landscape/trunk/packages" && node %<CR>
  au FileType javascript noremap <leader>m :wa \| !mocha %<CR>
  au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType stylus set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType jade set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType handlebars set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Python specific
  au FileType python noremap <leader>r :wa \| !python %<CR>
  au FileType python set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
"
" Java specific  
  au FileType java noremap mm        :wa \| !javac %:p:h/*.java<CR>

" Turn Menu and toolbar off
	set guioptions=-m
	set guioptions=-M

" Turn scrollbars off
  set guioptions-=r  
  set guioptions-=b 

  au FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2

" Line numbers
  nmap <leader>' :set relativenumber!<cr>
  nmap <leader>" :set number!<cr>
  
"strip all trailing whitespace in the current file"
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Automatically remove trailing spaces"
  au FileType c,cpp,java,php,js,py,coffee au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

"Enable filtype plugins
  filetype plugin on
  filetype indent on

" Buffer and Tab Navigation
  map <C-j> :bp<CR>
  map <C-k> :bn<CR>

  if (isMac)
    map <D-j> :tabp<CR>
    map <D-k> :tabn<CR>
  else
    map <M-j> :tabp<CR>
    map <M-k> :tabn<CR>
  endif

" Buffer Explorer plugins
    " don't override <leader>t which is I use for ctrlp
    let g:buffergator_suppress_keymaps=1 
    " all we need is to toggle buffer pane since we don't use tabs
    nnoremap <silent> <Leader>b :BuffergatorToggle<CR>


" alt+n or alt+p to navigate between entries in QuickFix
  map <silent> <M-p> :cp <CR>
  map <silent> <M-n> :cn <CR>
  
  nmap <silent> <S-u> :GundoToggle <CR>

"Ruby
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby comp ruby

  au FileType ruby mlet g:rubycomplete_buffer_loading = 1
  au FileType ruby mlet g:rubycomplete_classes_in_global = 1

  au FileType ruby map <F1> :!ri	<CR>
  au FileType ruby map <F3> :!irb<CR>
  au FileType ruby noremap <leader>r !ruby %<CR>

" Flex/ActionScript
  au FileType actionscript,mxml set omnifunc=actionscriptcomplete#Complete

"Auto Compile CoffeScript on save
  if(isGui)
    " Below prevents saving
    let coffee_make_options = "-p"
    au BufWritePost *.coffee silent CoffeeMake -b | cwindow
  endif
  
" Minibuffer Explorer Settings
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplMapWindowNavArrows = 1
  let g:miniBufExplMapCTabSwitchBufs = 1
  let g:miniBufExplModSelTarget = 1

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
   
" FileUtils
  " NerdTree  
    map <C-l> :NERDTreeToggle<CR>
    
" Close current buffer
  map <silent> <leader>q :bd<CR> 	
  
" Write all then run spec for current dir
  map <silent> ,s :wa \|S spec . --format progress <CR> <CR> 
  map <silent> ,; :wa \|! spec . --color --format specdoc <CR> <CR> 
  map <silent> ,: :wa \|! spec . --format html:spec/spec_report.html <CR> <CR> 
 
" Open new terminal shell
  map <leader>d :sh <CR>

" EasyGrep options

let g:EasyGrepFileAssociations='/Users/thlorenz/.vim/bundle/easygrep/plugin/EasyGrepFileAssociations'
let g:EasyGrepMode=0
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=0
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=1
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0

" Quiet Lusty Juggler warnings that appear in sudo mode
let g:LustyExplorerSuppressRubyWarning = 1

" CtrlP options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/dist/*,*/.git/*,*/.svn/*,*/dist/*,*.o,*.hi,*.sqlite3

"Commands
command! -nargs=* Wrap set wrap linebreak nolist

"Shell inside Vim	
command! -complete=shellcmd -nargs=+ S call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  let isfirst = 1
  let words = []
  for word in split(a:cmdline)
    if isfirst
      let isfirst = 0  " don't change first word (shell command)
    else
      if word[0] =~ '\v[%#<]'
        let word = expand(word)
      endif
      let word = shellescape(word, 1)
    endif
    call add(words, word)
  endfor
  let expanded_cmdline = join(words)
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile wrap
  call setline(1, expanded_cmdline)
  call append(line('$'), substitute(getline(2), '.', '=', 'g'))
  silent execute '$read !'. expanded_cmdline
  resize 15
  setlocal nomodifiable
endfunction

" Diff current Buffer with original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Enable Camel-Case search
nnoremap <expr> <leader>/ SearchCamelCase('/')
nnoremap <expr> <leader>? SearchCamelCase('?')
function! SearchCamelCase(dir)
    call inputsave()
    let ab = input(a:dir)
    call inputrestore()
    let l = filter(split(toupper(ab), '\zs'), 'v:val =~ "\\w"')
    if len(l) > 0
        let l[0] = '[' . l[0] . tolower(l[0]) . ']'
    end
    let @/ = '\C\<' . join(map(l, 'v:val . "[0-9a-z_]*"'), '') . '\>'
    return a:dir . "\r"
endfunction

" different color scheme for markdown buffers
augroup filetype_colorscheme
    au BufEnter *
    \ if !exists('b:colors_name')
        \ | if &ft == "markdown"
            \ | let b:colors_name = 'wombat256mod'
            \ | set tw=120 fo=cqt wm=0
        \ | else
            \ | let b:colors_name = 'wombat256mod'
        \ | endif
    \ | endif
    \ | exe 'colorscheme' b:colors_name
augroup END 
