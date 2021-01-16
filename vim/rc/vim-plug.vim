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

Plug 'preservim/nerdcommenter'
  let NERDSpaceDelims=1

""""""""""
" Snippets
""""""""""
" Follow `:h provider-python` instructions -> `python3 -m pip install --user --upgrade pynvim`
 Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetDirectories = ['/Users/thlorenz/.vim/UltiSnips']
  let g:UltiSnipsExpandTrigger="<C-j>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
  let g:UltiSnipsEditSplit="vertical"
  nmap <silent> <leader>es :UltiSnipsEdit<CR>
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
  noremap <leader>H :Dash! <CR>
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'tpope/vim-fugitive'
  noremap <leader>gs :Gstatus<cr>
  noremap <leader>gp :Gpush<cr>

" RustPlay command depends on this
Plug 'mattn/webapi-vim', { 'for': [ 'rust' ] }

" open current file in idea
au FileType dart,typescript,javascript,rust,go nmap <silent>gI :update \|!idea --line " . ( line(".") + 1 ) " %:p<CR>

""""""""""""""""""
" Keyboard Mapping
""""""""""""""""""

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] }

"""""""""""""""""
" File navigation
"""""""""""""""""

Plug 'rking/ag.vim'
  nnoremap <leader>sa :Ag<CR>

" brew install fzf bat
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  " let g:fzf_layout = { 'down': '60%' }
  let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.9 } }
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  let $FZF_DEFAULT_OPTS='--reverse' 

  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
  endif
  nnoremap <leader>l :Buffers<CR>
  nnoremap <C-t> :Files<CR>
  nnoremap <leader>sb :BLines<CR>
  nnoremap <leader>sl :Lines<CR>
  nnoremap <leader>sm :Marks<CR>
  nnoremap <leader>ss :Rg<CR>

Plug 'troydm/zoomwintab.vim'
  let g:zoomwintab_remap = 0
  nnoremap <C-w>o :ZoomWinTabToggle<CR>

"""""""""""""""""""""""""""""
" Syntax highlighters/support
"""""""""""""""""""""""""""""

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  nnoremap <leader>z za
  nnoremap <leader>Z zA
  " More setup in below section outside of call plug#end()

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
  autocmd! BufNewFile,BufRead *.gltf set ft=json
Plug 'nono/vim-handlebars'         , { 'for': ['handlebars'] }
Plug 'tsaleh/vim-tmux'             , { 'for': ['tmux'] }
Plug 'moll/vim-node'               , { 'for': ['javascript'] }
  autocmd FileType javascript map <buffer> gf <Plug>NodeGotoFile
Plug 'jparise/vim-graphql'         , { 'for': ['javascript'] }
Plug 'Glench/Vim-Jinja2-Syntax'    , { 'for': [ 'jinja' ] }
Plug 'leafgarland/typescript-vim'  , { 'for': [ 'typescript' ] }
Plug 'posva/vim-vue'               , { 'for': [ 'vue' ] }
  autocmd BufRead,BufNewFile *.vue setlocal filetype=vue
Plug 'cespare/vim-toml'            ,  { 'for': [ 'toml' ] }
Plug 'tikhomirov/vim-glsl'         ,  { 'for': [ 'glsl' ] }
  autocmd! BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
  au FileType glsl set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
Plug 'ron-rs/ron.vim'              ,  { 'for': [ 'ron' ] }
  autocmd! BufNewFile,BufRead *.scn set ft=ron

""""""""""""
" Make and Quickfix 
""""""""""""
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" Compilers
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile package.json,*.ts,*.js set makeprg=yarn

" Make Commands
au FileType rust nmap <silent><leader>bc :w \| Make build --all-targets<CR>
au FileType rust nmap <silent><leader>bb :w \| Make check --all-targets<CR>
au FileType rust nmap <silent><leader>bt :w \| Make test --features=test -- --show-output<CR>
au FileType rust nmap <silent><leader>bl :w \| Make clippy -Z unstable-options<CR>
au FileType rust nmap <silent><leader>fi :Make clippy --fix -Z unstable-options<CR>

au FileType typescript nmap <silent><leader>bb :w \| Make build<CR>
au FileType typescript nmap <silent><leader>bt :w \| Make test<CR>

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

  " select inner/outer function in visual mode
  xmap if <Plug>(coc-funcobj-i)
  xmap of <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap of <Plug>(coc-funcobj-a)

  " refactorings
  nmap <leader><C-r> <Plug>(coc-rename)
  nmap <leader>a <Plug>(coc-codeaction)
  xmap <leader>a <Plug>(coc-codeaction-selected)
  nmap co :wincmd b \| bel copen 16<CR> 
  nmap cc :cclose<CR>

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

"""""""""""
" PostInstalls
""""""""""
" These need to happen after `call plug#end()`

"
" nvim-treesitter
"

" :TSInstall bash c cpp c_sharp css go dart graphql html javascript json lua rust toml typescript
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { 
    disable = { "markdown", "javascript" },
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader>s;",
      node_incremental = ";",
      node_decremental = "'",
      scope_incremental = "[",
    },
  },
}
EOF

au FileType * set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() nofoldenable foldlevelstart=10
