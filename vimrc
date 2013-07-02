" Detect Environment
  let isGui  = has("gui_running")
  let isUnix = has("unix")
  let isMac  = has("mac")

filetype off
call pathogen#infect()
call pathogen#helptags()

" cn specific
set backupdir=~/.vimtmpdir,.
set directory=~/.vimtmpdir,.
set shell=/bin/bash

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
set smartcase

set backspace=2         
set nu
set hidden
set mouse=a

" from: http://items.sjbach.com/319/configuring-vim-right
" set wildmenu

" scroll viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" limit "Press Enter or ... to continue"
set shortmess=atI

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
  if (isGui)
    set gfn=Menlo:h18
  elseif(isMac)
    set gfn=Menlo-Powerline:h16
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
  
" Scala specific
  au FileType scala noremap <leader>r :wa \| call Send_to_Screen(join(getline(1,'$'), "\n")) \| call Send_to_Screen("\n")<CR>
 
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

" Web
  " browserreload
    let g:returnApp = "iTerm"
    noremap <leader>kk :ChromeReload<CR>
    noremap <leader>ka :ChromeReloadStart<CR>
    noremap <leader>ks :ChromeReloadStop<CR>

  " JavaScript specific
  " au FileType javascript source /Users/thlorenz/dotfiles/vim/bundle/tern/vim/tern.vim
    au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

    au FileType javascript noremap <leader>r :wa \| ! node %<CR>
    " au FileType javascript noremap <leader>r :wa \| !export NODE_PATH="/Users/thlorenz/dev/lab49/Landscape/trunk/packages" && node %<CR>
    au FileType javascript noremap <leader>m :wa \| !mocha %<CR>
    au FileType javascript nnoremap <buffer> <leader>D  :<C-u>call WriteJSDocComment()<CR>
    au FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType stylus set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType jade set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType handlebars set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
    au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

  " CSS specific
    au FileType css set omnifunc=csscomplete#CompleteCSS

  " Html specific
    au FileType html set omnifunc=htmlcomplete#CompleteTags

" C specific
" au FileType c noremap <leader>r :wa \| make \| !./%:r<CR> 
  au FileType c noremap <leader>r :wa \| make %:r && ./%:r && rm ./%:r<CR>
  
" C++ specific
  set ut=100000
  au FileType cpp,cc noremap <leader>r :<C-U>make %:r && ./%:r && rm ./%:r<CR>
 
" Python specific
  au FileType python set omnifunc=pythoncomplete#Complete
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

  au FileType markdown set tabstop=2 softtabstop=2 shiftwidth=2 tw=120 fo=cqt wm=0

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


" toggle highlight line
  hi CursorLine term=underline ctermbg=236 guibg=#32322f
  noremap <leader>j :set cursorline!<CR>

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

" CoffeeScript specific
  au FileType coffee noremap <leader>r :wa \| ! coffee %<CR>
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
  map <leader>d :!bash <CR>

" EasyGrep options

let g:EasyGrepFileAssociations=expand('~')+'/.vim/bundle/easygrep/plugin/EasyGrepFileAssociations'
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

" powerline options
let g:Powerline_symbols = 'fancy'
set t_Co=256

" CtrlP options
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 'r'
set wildignore+=*/dist/*,*/.git/*,*/.svn/*,*/dist/*,*.o,*.hi,*.sqlite3

" VCS specific
let g:VCSCommandDeleteOnHide=1

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

" If you are using a console version of Vim, or dealing
" with a file that changes externally (e.g. a web server log)
" then Vim does not always check to see if the file has been changed.
" The GUI version of Vim will check more often (for example on Focus change),
" and prompt you if you want to reload the file.
"
" There can be cases where you can be working away, and Vim does not
" realize the file has changed. This command will force Vim to check
" more often.
"
" Calling this command sets up autocommands that check to see if the
" current buffer has been modified outside of vim (using checktime)
" and, if it has, reload it for you.
"
" This check is done whenever any of the following events are triggered:
" * BufEnter
" * CursorMoved
" * CursorMovedI
" * CursorHold
" * CursorHoldI
"
" In other words, this check occurs whenever you enter a buffer, move the cursor,
" or just wait without doing anything for 'updatetime' milliseconds.
"
" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>1})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>1, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>1})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)

function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  echo msg
  let @"=reg_saved
endfunction
