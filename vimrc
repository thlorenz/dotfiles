filetype off
call pathogen#infect()
call pathogen#helptags()

set nocompatible     
let mapleader=","

" Esc alternative
imap   ii          <Esc>

set statusline=%F%m%r%h%w%<\ %{&ff}\ %Y\ %=%l/%L,%v\ %p%%

" Detect Environment
  let isGui  = has("gui_running")
  let isUnix = has("unix")
  let isMac  = has("mac")

" Editing and reloading vimrc
  nmap <silent> <leader>ev :e $MYVIMRC <CR>
  nmap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>	
  au BufWritePost $MYVIMRC source $MYVIMRC

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

" Code Completion like VS
imap   <C-Space>   <C-n>

" Tagbar
  map <silent> « :TagbarToggle<CR>

" Haskell specific
  au FileType haskell compiler ghc

" Configure browser for haskell_doc.vim
  let g:haddock_browser = "open"
  let g:haddock_browser_callformat = "%s %s"

  
  if(isGui) 
    set columns=137
    set lines=71
  endif

  syn on
  colo desert

  set virtualedit=
  set nobackup
  set nowritebackup
  set noswapfile

" Turn Menu and toolbar off
	set guioptions=-m
	set guioptions=-M

" Turn scrollbars off
  set guioptions-=r  
  set guioptions-=b 

"Set smaller tab size
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
	set	expandtab
  set nowrap

  au FileType markdown set tabstop=4 softtabstop=4 shiftwidth=4

" Show columns
  set ruler

" Scroll before hitting top/bottom  
  set scrolloff=2

" Search
  set incsearch 

" more powerful backspacing
  set backspace=2         

" Show line numbers
  set nu
  nmap <leader>' :set relativenumber!<cr>
  nmap <leader>" :set number!<cr>
  
"strip all trailing whitespace in the current file"
  nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Automatically remove trailing spaces"
  au FileType c,cpp,java,php,js,py,coffee au BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))


"Maximize Window
"	au GUIEnter * simalt ~x
	
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

  set hidden

" alt+n or alt+p to navigate between entries in QuickFix
  map <silent> <M-p> :cp <CR>
  map <silent> <M-n> :cn <CR>
  
  nmap <silent> <S-u> :GundoToggle <CR>

"Ruby
  au FileType ruby,eruby set omnifunc=rubycomplete#Complete
  au FileType ruby,eruby comp ruby

  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1

  map <F1> :! ri	<CR>
  map <f2> :!ruby -r debug %<CR>
  map <f3> :!irb<CR>

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
  map <silent> <leader>, :bd<CR> 	
  
" Write all then run spec for current dir
  map <silent> ,s :wa \|S spec . --format progress <CR> <CR> 
  map <silent> ,; :wa \|! spec . --color --format specdoc <CR> <CR> 
  map <silent> ,: :wa \|! spec . --format html:spec/spec_report.html <CR> <CR> 
 
" Open new terminal shell
  map <leader>d :sh <CR>

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
  1
endfunction

" Diff current Buffer with original file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
