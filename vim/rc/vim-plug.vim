call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'godlygeek/tabular'
  noremap <silent> <leader>f=  :Tabularize /=<CR>
  noremap <silent> <leader>f,  :Tabularize /,<CR>
  noremap <silent> <leader>f;  :Tabularize /;<CR>
  noremap <silent> <leader>f:  :Tabularize /:<CR>
  noremap <silent> <leader>f(  :Tabularize /(<CR>
  noremap <silent> <leader>f\  :Tabularize /\<CR>
Plug 'sjl/gundo.vim'
  nnoremap <silent> <S-u> :GundoToggle <CR>

Plug 'scrooloose/nerdcommenter'
Plug 'thlorenz/snipmate-mine'
Plug 'purescript-contrib/purescript-vim'
  au FileType purescript noremap <leader>r :wa \| !pulp --psc-package run<CR>

Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript','c','cc','cpp'] }
  au FileType javascript,c,cc,cpp nmap <silent> <buffer> <leader>D ?function<cr>:noh<cr><Plug>(jsdoc)<CR>

Plug 'justinmk/vim-sneak'

Plug 'mikewest/vimroom'

" Fix copy/paste
Plug 'christoomey/vim-system-copy'

Plug 'tbastos/vim-lua', { 'for': 'lua' }

" Buffer/File Navigation
Plug 'majutsushi/tagbar'
  nnoremap <silent> « :TagbarToggle<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <leader>n :NERDTreeToggle<CR>

Plug 'rking/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_max_files=0
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_map='<Leader>t'
  let g:ctrlp_working_path_mode='r'
  let g:ctrlp_match_window='bottom'
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
Plug 'jparise/vim-graphql'         , { 'for': ['javascript'] }
Plug 'Glench/Vim-Jinja2-Syntax'    , { 'for': [ 'jinja' ] }
Plug 'leafgarland/typescript-vim'  , { 'for': [ 'typescript' ] }
Plug 'posva/vim-vue'               , { 'for': [ 'vue' ] }
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme = 'jellybeans'
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline_powerline_fonts = 1
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

"" misc
Plug 'vim-scripts/vim-http-client'
  let g:http_client_bind_hotkey=0
  silent! nnoremap <unique> <leader>h :HTTPClientDoRequest<cr>

Plug 'kannokanno/previm', { 'for': [ 'markdown' ] }
  let g:previm_open_cmd = 'open -a Google\ Chrome'

Plug 'tpope/vim-dispatch'

"" time tracking
Plug 'wakatime/vim-wakatime'

"" simplenote
Plug 'mrtazz/simplenote.vim'

"" documentation
Plug 'rizzatti/dash.vim'
  noremap <leader>b :Dash <CR>
  "" Dash BabylonJS
  noremap <leader>v "zyiw:exe "Dash ".@z." babylonjs" <CR>


"" sharing
""" share code as a nice image
Plug 'kristijanhusak/vim-carbon-now-sh'

" AutoCompletion + Linters
"Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'thlorenz/snippets'

"  let g:UltiSnipsExpandTrigger = "<tab>"
"  let g:UltiSnipsJumpForwardTrigger = "<tab>"
"  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'npm install' }
  let g:tern_show_signature_in_pum = 1
  let g:tern_show_argument_hints = 'on_hold'
  set completeopt-=preview
  autocmd FileType javascript map <buffer> gd :TernDef<CR>
  autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>

" JavaScript Code Completion via TypeScript Server
" Requires: npm install -g typescript typescript-language-server
" Add the following (or similar) in <project-root>/jsconfig.json:
"{
"  "compilerOptions": {
"    "module": "commonjs",
"    "target": "es6",
"    "checkJs": true,
"    "lib": [ "es6" ],
"    "resolveJsonModule": true
"  },
"  "exclude": [ "node_modules" ]
"}
"Plug 'prabirshrestha/async.vim'            , { 'for': ['javascript', 'typescript' ] }
"Plug 'prabirshrestha/asyncomplete.vim'     , { 'for': ['javascript', 'typescript' ] }
"Plug 'prabirshrestha/vim-lsp'              , { 'for': ['javascript', 'typescript' ] }
"Plug 'ryanolsonx/vim-lsp-typescript'       , { 'for': ['javascript', 'typescript' ] }
"Plug 'prabirshrestha/asyncomplete-lsp.vim' , { 'for': ['javascript', 'typescript' ] }
  " convert imports to requires
  " (https://stackoverflow.com/a/2024537/97443)
  let @r="gg/importcwconstf}a =/fromcf require(2f'a)ld$"
  noremap <leader>fr @r

"" C#
Plug 'OmniSharp/omnisharp-vim' , { 'for': [ 'cs' ] }
  let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
  let g:omnicomplete_fetch_full_documentation = 1
    set completeopt=longest,menuone,preview
    set previewheight=5
    nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
  "autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
  autocmd FileType cs nnoremap <silent> <C-]> :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
  autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
  autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
  autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>

"" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin', { 'for': [ 'dart' ] }
Plug 'thosakwe/vim-flutter', { 'for': [ 'dart' ] }
  let g:flutter_show_log_on_run=0


  au FileType dart nnoremap <leader>r :FlutterRun<CR>
  au FileType dart nnoremap <leader>fl :FlutterVSplit<CR>
  au FileType dart nnoremap <leader>fq :FlutterQuit<cr>
  au FileType dart nnoremap <leader>fr :FlutterHotReload<cr>
  au FileType dart nnoremap <leader>fR :FlutterHotRestart<cr>
  au FileType dart nnoremap <leader>fD :FlutterVisualDebug<cr>
  au FileType dart nnoremap <silent> <leader>fo :!flutter format %<CR>
  
  " open current file/line in idea (in case some coc features aren't working)
  au FileType dart,typescript nmap <silent>gi :update \|!idea --line " . line(".") . " %:p<CR>


Plug 'natebosch/vim-lsc', { 'for': [ 'dart' ] }
  Plug 'natebosch/vim-lsc-dart', { 'for': [ 'dart' ] }
  let g:lsc_auto_map = v:false
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Sample config https://github.com/neoclide/coc.nvim#example-vim-configuration
  nmap <silent> <C-]> <Plug>(coc-type-definition)
  nmap <silent> <C-[> <Plug>(coc-references)

  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  nmap <silent> gd <Plug>(coc-type-definition)
  nmap <silent> gy <Plug>(coc-implementation)
  nmap <leader><C-r> <Plug>(coc-rename)
  inoremap <silent><expr> <c-space> coc#refresh()
  xmap <C-t> <Plug>(coc-codeaction)
  nmap <C-t> <Plug>(coc-codeaction)
  nnoremap <silent> <C-s>a  :<C-u>CocList diagnostics<cr>

  set signcolumn=yes


  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  " Installed coc extensions
  "   - coc-flutter
  "   - coc-tsserver
  "   - coc-json
  "   - coc-prettier

Plug 'w0rp/ale'
  let g:ale_linters = {
  \   'javascript': ['standard'],
  \   'cs': ['OmniSharp'],
  \}
  let g:ale_fixers = {
  \   'javascript': ['standard'],
  \}
  au FileType javascript,cs nnoremap <leader>fi :ALEFix<CR>
  let g:ale_lint_on_text_changed = 'never'
  let g:ale_lint_on_enter = 0
  let g:ale_lint_delay = 200
  " The below three were added b/c AlEFix broke for reasons I don't understand
  " This fixes it but hardcodes way more things than I'd like (esp. the config path)
  let g:ale_typescript_tslint_use_global = 1
  let g:ale_typescript_tslint_executable = '/Users/thlorenz/npm-global/bin/tslint'
  let g:ale_typescript_tslint_config_path = '/Volumes/d/dev/ns/udacity/uda-instamap-web'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer', 'for': [ 'c', 'cpp' ] }
  let g:ycm_complete_in_comments_and_strings=0
  let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
  let g:ycm_use_ultisnips_completer = 0
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_always_populate_location_list = 1
  let g:ycm_auto_trigger=1
  let g:ycm_show_diagnostics_ui = 1
  let g:ycm_key_invoke_completion = '<C-k>'

  let g:ycm_autoclose_preview_window_after_completion = 1
    au FileType typescript let g:ycm_autoclose_preview_window_after_completion = 0
    au FileType typescript,javascript nnoremap <leader>wd :pclose<CR>

  au FileType c,cc,cpp,cs nnoremap <silent> <C-]> :YcmCompleter GoTo <CR>
  au FileType c,cc,cpp,cs,javascript nnoremap <leader>ff :YcmCompleter FixIt<CR>
  au FileType c,cc,cpp,cs,javascript nnoremap <leader>fm :YcmCompleter RefactorRename<Space>
  au FileType c,cc,cpp,cs,dart,javascript nnoremap <leader>fd :YcmCompleter GetDoc<CR>
  au FileType c,cc,cpp,cs noremap <leader>fo :YcmCompleter Format<CR>
  au FileType c,cc,cpp,cs vmap <leader>fo :YcmCompleter Format<CR>

  " autocmd bufwritepost *.js silent !standard % --fix
  set autoread

  au FileType javascript nnoremap <leader>fo :ALEFix<CR>
  au FileType javascript noremap <leader>Fo :!standard --fix % > /dev/null<CR>
  au FileType javascript vmap <leader>Fo :!standard --fix %<CR>
  "au FileType typescript nnoremap <leader>Fo :set autoread \| !tsfmt -r % > /dev/null \| set noautoread<CR>

  let g:ycm_global_ycm_extra_conf = "~/.vim/rc/ycm_extra_conf.py"

  highlight link YcmErrorSection warning

" Svelte
Plug 'evanleck/vim-svelte'

call plug#end()
