call plug#begin('~/.vim/plugged')

""""""""
" Themes
""""""""

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

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
" Follow `:h provider-python` instructions -> `python3 -m pip install --user --upgrade pynvim`
 Plug 'SirVer/ultisnips'
   let g:UltiSnipsSnippetDirectories = ['/Users/thlorenz/.vim/UltiSnips']
   let g:UltiSnipsExpandTrigger="<TAB>"
   let g:UltiSnipsJumpForwardTrigger="<C-j>"
   let g:UltiSnipsJumpBackwardTrigger="<C-k>"
   let g:UltiSnipsEditSplit="vertical"
 Plug 'honza/vim-snippets'

""""""""""""""""""""""""""""""""""
" Integration with System/Terminal
""""""""""""""""""""""""""""""""""

Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <leader>n :NERDTreeToggle<CR>
  map <leader><s-n> :NERDTreeFind<CR>

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
  noremap <leader>h :Dash <CR>
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'tpope/vim-fugitive'
  noremap gs :Gstatus<cr>
  noremap gp :Gpush<cr>

" open current file in idea
au FileType dart,typescript,javascript,rust nmap <silent>gI :update \|!idea --line " . line(".") . " %:p<CR>


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
Plug 'evanleck/vim-svelte'         , { 'for': [ 'svelte' ] }
Plug 'cespare/vim-toml'            ,  { 'for': [ 'toml' ] }
Plug 'tikhomirov/vim-glsl'         ,  { 'for': [ 'glsl' ] }
  autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl


""""""""""""
" Status bar
""""""""""""
Plug 'itchyny/lightline.vim'
  let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'gitbranch', 'mode', 'paste' ],
      \             [ 'readonly', 'relativepath', 'status', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'inactive': {
      \   'left': [['relativepath']],
      \ },
      \ 'component_function': {
      \   'status': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'mode_map': {
      \   'n' : 'NO',
      \   'i' : 'IN',
      \   'R' : 'RO',
      \   'v' : 'VI',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'CO',
      \   's' : 'SE',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'TE',
      \ },
      \}

"""""""""""
" Coc
""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-highlight',
  \ 'coc-flutter'
\]
Plug 'ianks/vim-tsx'

  " naviation
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  command! -nargs=0 CoqGotoProjectConfig :call CocAction('runCommand', 'tsserver.goToProjectConfig')
  nmap <leader>gp :CoqGotoProjectConfig<cr>

  " coc list + commands
  nmap <silent> <leader>cx :CocList --number-select diagnostics<CR>
  nmap <silent> <leader>cc :CocList --number-select commands<CR>
  nmap <silent> <leader>cs :CocList --interactive symbols<CR>
  nmap <silent> <leader>cr :CocRestart<CR>
  nmap <silent> <leader>s<Space> :CocSearch

  " select inner/outer function in visual mode
  xmap if <Plug>(coc-funcobj-i)
  xmap of <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap of <Plug>(coc-funcobj-a)

  " refactorings
  nmap <leader><C-r> <Plug>(coc-rename)
  nmap <leader>a <Plug>(coc-codeaction)
  xmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>co :copen<CR>
  nmap <leader>cc :cclose<CR>

  " fixes
  nmap <leader>ff <Plug>(coc-fix-current)
  command! -nargs=0 CoqOrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
  nmap <leader> fo :CoqOrganizeImports<cr>
  command! -nargs=0 CoqAutofix :call CocAction('runCommand', 'tsserver.executeAutofix')
  nmap <leader>fi :CoqAutofix<cr>
  nmap <leader>ff :CocFix<cr>

  " Completion
  inoremap <silent><expr> <c-n> coc#refresh()

  " Documentation for Symbol under Cursor
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  " Highlight References of Symbol under Cursor
  nnoremap <silent> L :call CocActionAsync('highlight')<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " outline
  Plug 'liuchengxu/vista.vim'

call plug#end()
