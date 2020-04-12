call plug#begin('~/.vim/plugged')

"""""""""
" Editing
"""""""""

Plug 'godlygeek/tabular'
  noremap <silent> <leader>f=  :Tabularize /=<CR>
  noremap <silent> <leader>f,  :Tabularize /,<CR>
  noremap <silent> <leader>f;  :Tabularize /;<CR>
  noremap <silent> <leader>f:  :Tabularize /:<CR>
  noremap <silent> <leader>f(  :Tabularize /(<CR>
  noremap <silent> <leader>f\  :Tabularize /\<CR>
Plug 'sjl/gundo.vim'
  nnoremap <silent> <S-u> :GundoToggle <CR>

""""""""""
" Snippets
""""""""""

Plug 'honza/vim-snippets'
Plug 'thlorenz/snippets'
Plug 'thlorenz/snipmate-mine'

""""""""""""""""""""""""""""""""""
" Integration with System/Terminal
""""""""""""""""""""""""""""""""""

Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <leader>n :NERDTreeToggle<CR>

Plug 'thinca/vim-quickrun'
  noremap <silent> <leader>R :QuickRun -mode n<CR>
  vnoremap <silent> <leader>R :QuickRun -mode v<CR>
  let b:quickrun_config={
\    'hook/shebang':1,
\    'outputter/buffer/append':0,
\    'outputter/buffer/into':0,
\    'outputter/buffer/close_on_empty':1
\ }

Plug 'kannokanno/previm', { 'for': [ 'markdown' ] }
  let g:previm_open_cmd = 'open -a Google\ Chrome'

""""""""""""""""""""""""""""""""
" Integration with External Tools
""""""""""""""""""""""""""""""""

Plug 'wakatime/vim-wakatime'
Plug 'mrtazz/simplenote.vim'
Plug 'rizzatti/dash.vim'
  noremap <leader>b :Dash <CR>
  "" Dash BabylonJS
  noremap <leader>v "zyiw:exe "Dash ".@z." babylonjs" <CR>
Plug 'kristijanhusak/vim-carbon-now-sh'

" open current file in idea
au FileType dart,typescript,javascript nmap <silent>gi :update \|!idea --line " . line(".") . " %:p<CR>


"""""""""""""""""
" File navigation
"""""""""""""""""

Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_max_files=0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_map='<Leader>t'
  let g:ctrlp_working_path_mode='r'
  let g:ctrlp_match_window='bottom'
  nnoremap <leader>l :CtrlPBuffer <CR>


"""""""""""""""""""""""""""""
" Syntax highlighters/support
"""""""""""""""""""""""""""""

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
Plug 'jparise/vim-graphql'         , { 'for': ['javascript'] }
Plug 'Glench/Vim-Jinja2-Syntax'    , { 'for': [ 'jinja' ] }
Plug 'leafgarland/typescript-vim'  , { 'for': [ 'typescript' ] }
Plug 'posva/vim-vue'               , { 'for': [ 'vue' ] }
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
Plug 'evanleck/vim-svelte'

""""""""""""
" Status bar
""""""""""""

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme = 'jellybeans'
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 0
  let g:airline#extensions#tabline#left_sep=' '
  let g:airline#extensions#tabline#left_alt_sep='¦'
  let g:airline#extensions#tabline#buffer_nr_show = 1

call plug#end()
