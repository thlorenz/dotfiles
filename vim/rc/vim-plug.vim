call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
  nnoremap <silent> <leader>f=	 :Tabularize /=<CR>
  nnoremap <silent> <leader>f,	 :Tabularize /,<CR>
  nnoremap <silent> <leader>f;	 :Tabularize /;<CR>
  nnoremap <silent> <leader>f:	 :Tabularize /:<CR>
  nnoremap <silent> <leader>f(	 :Tabularize /(<CR>
  nnoremap <silent> <leader>f\	 :Tabularize /\<CR>
Plug 'sjl/gundo.vim'
  nnoremap <silent> <S-u> :GundoToggle <CR>

Plug 'scrooloose/syntastic'
  let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': ['js'], 'passive_filetypes': ['c', 'cc', 'cpp'] }
  let g:syntastic_javascript_checkers = ['jshint']
  let g:syntastic_c_compiler      = 'clang'
  let g:syntastic_c_config_file   = '.syntastic_c'
  let g:syntastic_cpp_compiler    = 'clang++'
  let g:syntastic_cpp_config_file = '.syntastic_c'

Plug 'scrooloose/nerdcommenter'
Plug 'thlorenz/snipmate-mine'

Plug 'tanabe/WriteJSDocComment.vim', { 'for': ['javascript','c','cc','cpp'] }
  au FileType javascript,c,cc,cpp nnoremap <buffer> <leader>D :<C-u>call WriteJSDocComment()<CR>

Plug 'justinmk/vim-sneak'

" AutoCompletion
Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'thlorenz/snippets'

  let g:UltiSnipsExpandTrigger = "<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
  let g:ycm_complete_in_comments_and_strings=0
  let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
  let g:ycm_use_ultisnips_completer = 1
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_completion = 1
  let g:ycm_always_populate_location_list = 1

  au FileType c,cc,cpp nnoremap <silent> <C-]> :YcmCompleter GoTo <CR>

  let g:ycm_global_ycm_extra_conf = "~/.vim/rc/ycm_extra_conf.py"

Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  let g:tern_show_signature_in_pum = 1
  let g:tern_show_argument_hints = 'on_hold'
  set completeopt-=preview
  autocmd FileType javascript map <buffer> gd :TernDef<CR>
  autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>

" Buffer/File Navigation
Plug 'majutsushi/tagbar'
  nnoremap <silent> « :TagbarToggle<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <leader>n :NERDTreeToggle<CR>

Plug 'moll/vim-node', {'for': ['javascript']}
  autocmd FileType javascript map <buffer> gf <Plug>NodeGotoFile

Plug 'rking/ag.vim'
  nnoremap <leader>f :Ag<space>
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_max_files=0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_map='<Leader>t'
  let g:ctrlp_working_path_mode='r'
  nnoremap <leader>l :CtrlPBuffer <CR>

Plug 'christoomey/vim-tmux-navigator'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"" switch between implementation and header files for C/C++
Plug 'vim-scripts/a.vim'

"" delete buffers without closing your windows
Plug 'moll/vim-bbye'
  nnoremap <silent> <leader>q :Bdelete<CR>

" Syntax highlighters/support
Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'     , { 'for': ['javascript'] }
Plug 'thlorenz/vim-markdown'       , { 'for': ['markdown'] }
Plug 'kchmck/vim-coffee-script'    , { 'for': ['coffee'] }
Plug 'vim-ruby/vim-ruby'           , { 'for': ['ruby'] }
Plug 'lukerandall/haskellmode-vim' , { 'for': ['haskell'] }
Plug 'ekalinin/Dockerfile.vim'     , { 'for': ['docker'] }
Plug 'kelan/gyp.vim'               , { 'for': ['gyp'] }
Plug 'chase/vim-ansible-yaml'      , { 'for': ['ansible'] }
Plug 'elzr/vim-json'               , { 'for': ['json'] }
Plug 'nono/vim-handlebars'         , { 'for': ['handlebars'] }
Plug 'tsaleh/vim-tmux'             , { 'for': ['tmux'] }
Plug 'moll/vim-node'               , { 'for': ['javascript'] }
  autocmd FileType javascript map <buffer> gf <Plug>NodeGotoFile

" Status bar
Plug 'bling/vim-airline'
  let g:airline_theme = 'jellybeans'
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline_powerline_fonts = 0
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#left_sep=' '
  let g:airline#extensions#tabline#left_alt_sep='¦'
  let g:airline#extensions#tabline#buffer_nr_show = 1

" External Tools Integration
Plug 'tell-k/vim-browsereload-mac'
  let g:returnApp = "iTerm"
  noremap <leader>kk :wa \| ChromeReload<CR>
  noremap <leader>ka :ChromeReloadStart<CR>
  noremap <leader>ks :ChromeReloadStop<CR>

Plug 'Shougo/vimproc'
Plug 'thinca/vim-quickrun'
  noremap <silent> <leader>R :QuickRun -mode n<CR>
  vnoremap <silent> <leader>R :QuickRun -mode v<CR>
  let b:quickrun_config={
\    'hook/shebang':1,
\    'outputter/buffer/append':0,
\    'outputter/buffer/into':0,
\    'outputter/buffer/close_on_empty':1
\ }

"" git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>gr :Gremove<CR>
  set diffopt=vertical " Show always vertical diff
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

"" misc
Plug 'vim-scripts/vim-http-client'
  let g:http_client_bind_hotkey=0
  silent! nnoremap <unique> <leader>h :HTTPClientDoRequest<cr>

Plug 'kannokanno/previm', { 'for': [ 'markdown' ] }
	let g:previm_open_cmd = 'open -a Google\ Chrome'

Plug 'tpope/vim-dispatch'

"" time tracking
Plug 'wakatime/vim-wakatime'

call plug#end()
