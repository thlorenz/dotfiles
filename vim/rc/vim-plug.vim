call plug#begin('~/.vim/plugged')

" Themes {{{
"""""""""""

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" }}}

" Editing {{{
"""""""""""""

Plug 'godlygeek/tabular'
  noremap <silent> <leader>t=  :Tabularize /=<CR>
  noremap <silent> <leader>t,  :Tabularize /,<CR>
  noremap <silent> <leader>t;  :Tabularize /;<CR>
  noremap <silent> <leader>t:  :Tabularize /:<CR>
  noremap <silent> <leader>t(  :Tabularize /(<CR>
  noremap <silent> <leader>t\  :Tabularize /\<CR>
Plug 'sjl/gundo.vim'
  nnoremap <silent> <S-u> :GundoToggle <CR>

Plug 'preservim/nerdcommenter'
  let NERDSpaceDelims=1"
" }}}

" Snippets {{{
""""""""""""""
" Follow `:h provider-python` instructions -> `python3 -m pip install --user --upgrade pynvim`
 Plug 'SirVer/ultisnips'
  let g:UltiSnipsSnippetDirectories = ['/Users/thlorenz/.vim/UltiSnips']
  let g:UltiSnipsExpandTrigger="<C-j>"
  let g:UltiSnipsJumpForwardTrigger="<C-j>"
  let g:UltiSnipsJumpBackwardTrigger="<C-k>"
  let g:UltiSnipsEditSplit="vertical"
  nmap <silent> <leader>es :UltiSnipsEdit<CR>
 Plug 'honza/vim-snippets'
" }}}

" Integration with System, Terminal, External Tools {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  map <leader>n :NERDTreeToggle<CR>
  map <leader><s-n> :NERDTreeFind<CR>

Plug 'voldikss/vim-floaterm' 
  let g:floaterm_keymap_toggle = ',,'
  let g:floaterm_autoinsert = 0

  let g:executed_floaterm = 0
  function! FloatermExec(tool, cmd)
    let autoinsert = g:floaterm_autoinsert
    let title = g:floaterm_title

    let g:floaterm_autoinsert = 1
    let g:floaterm_title = a:tool 
      if g:executed_floaterm == 0
        exe 'silent! FloatermNew --silent --name=' . a:tool . ' --height=0.9 --width=0.6'
        let g:executed_floaterm = 1
      endif
      exe 'silent! FloatermSend --name=' . a:tool . ' ' . a:tool . ' ' . a:cmd
      exe 'silent! FloatermShow ' . a:tool
    let g:floaterm_title = title
    let g:floaterm_autoinsert = autoinsert 
  endfunction


" Markdown/VimWiki {{{2
Plug 'vimwiki/vimwiki'
  let g:vimwiki_list = [{'path': '~/.wiki', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_ext2syntax =  { '.md': 'markdown', '.markdown': 'markdown' }
  let g:vimwiki_markdown_link_ext = 1
  au FileType vimwiki nmap <leader>tl <Plug>VimwikiToggleListItem
  au FileType vimwiki vmap <leader>tl <Plug>VimwikiToggleListItem

Plug 'tpope/vim-markdown', { 'for': ['markdown'] }
  au FileType markdown,vimwiki noremap <leader>mc :call ToggleConcealLevel()<CR>
  function! ToggleConcealLevel()
      if &conceallevel
          setlocal conceallevel=0
      else
          setlocal conceallevel=2
      endif
  endfunction

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'npm -g install instant-markdown-d'}
  let g:instant_markdown_autostart = 0
  au FileType markdown,vimwiki nnoremap <leader>md :InstantMarkdownPreview<CR>
" }}}2

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
" }}}1

" Keyboard Mapping Helpers {{{
""""""""""""""""""""""""""""""

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!', 'WhichKeyVisual', 'WhichKeyVisual!'] }
" }}}

" File navigation {{{1
"""""""""""""""""

" FZF {{{2
" brew install fzf bat
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  set rtp+=/usr/local/opt/fzf
  let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.5 } }
  let g:fzf_preview_window = ['right:70%:hidden', 'ctrl-o']
  let $FZF_DEFAULT_COMMAND = 'rg --files'
  let $FZF_DEFAULT_OPTS='--reverse' 

  if has('nvim')
    hi NormalFloat guibg=None
    if exists('g:fzf_colors.bg')
      call remove(g:fzf_colors, 'bg')
    endif
    let g:fzf_layout = { 'window': { 
          \'width': 0.75, 
          \'height': 0.50, 
          \'highlight': 'Special',
          \} }
  endif

  augroup FZF
    autocmd! FileType fzf
    autocmd FileType fzf setlocal nonumber norelativenumber signcolumn=no
    autocmd FileType fzf tnoremap <buffer> jk <C-c>
    autocmd FileType fzf tnoremap <buffer> <C-j> <C-n>
    autocmd FileType fzf tnoremap <buffer> <C-k> <C-p>
  augroup end

  if executable('rg')
    let g:ackprg = 'rg --vimgrep'
    set grepprg=rg\ --vimgrep\ --smart-case\ --follow
  endif
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

  nnoremap <leader>l  :Buffers<CR>
  nnoremap <leader>f  :Files<CR>
  nnoremap <leader>sg :GFiles<CR>
  nnoremap <leader>sb :BLines<CR>
  nnoremap <leader>sl :Lines<CR>
  nnoremap <leader>sm :Marks<CR>
  nnoremap <leader>sc :Commits<CR>
  nnoremap <leader>ss :Rg<CR>

Plug 'rking/ag.vim'
  nnoremap <leader>sa :Ag<CR>
"}}}2

Plug 'troydm/zoomwintab.vim'
  let g:zoomwintab_remap = 0
  nnoremap <C-w>o :ZoomWinTabToggle<CR>
"}}}1

" Syntax highlighters/support {{{
"""""""""""""""""""""""""""""""""

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  nnoremap <leader>z za
  nnoremap <leader>Z zA
  " More setup in below section outside of call plug#end()

Plug 'flazz/vim-colorschemes'
Plug 'pangloss/vim-javascript'     , { 'for': ['javascript'] }
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
Plug 'ianks/vim-tsx'
" }}}

" Make and Quickfix {{{
"""""""""""""""""""""""

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

au FileType rust nmap <silent>,bc :call FloatermExec('cargo', 'build --all-targets')<CR>
au FileType rust nmap <silent>,bb :call FloatermExec('cargo', 'check --all-targets')<CR>
au FileType rust nmap <silent>,bt :call FloatermExec('cargo', 'test --features=test -- --show-output')<CR>
au FileType rust nmap <silent>,bl :call FloatermExec('cargo', 'clippy -Z unstable-options')<CR>
au FileType rust nmap <silent>,bf :call FloatermExec('cargo', 'clippy --fix -Z unstable-options')<CR>

au FileType typescript nmap <silent><leader>bb :w \| Make build<CR>
au FileType typescript nmap <silent><leader>bt :w \| Make test<CR>

au FileType typescript nmap <silent>,bb :call FloatermExec('yarn', 'build')<CR>
au FileType typescript nmap <silent>,bt :call FloatermExec('yarn', 'test')<CR>

" Quickfix tweaks and mappings
au FileType qf call AdjustWindowHeight(10, 20)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

nmap cO :wincmd b \| bel copen 20<CR> 
nmap cc :cclose<CR>
nmap co cc cO
"}}}

" Status bar {{{
""""""""""""""""

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
"}}}

" Coc {{{1
""""""""""

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" # Coc Setup {{{2
"
" ## Fix timeouts
" 
" npm i -g vim-node-rpc
""""""""""""""""""""""""


let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-highlight',
  \ 'coc-flutter',
  \ 'coc-rust-analyzer'
\]
"}}}2

  " Coc Commands {{{2
  
  " navigatoin
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  command! -nargs=0 CoqGotoProjectConfig :call CocAction('runCommand', 'tsserver.goToProjectConfig')
  nmap <leader>gp :CoqGotoProjectConfig<cr>
"}}}

  " coc list + commands
  nmap <silent> <leader>cx :CocList --number-select diagnostics<CR>
  nmap <silent> <leader>cs :CocList --interactive symbols<CR>
  nmap <silent> <leader>cr :CocRestart<CR>
  nmap <silent> <leader>cd :CocDisable<CR>
  nmap <silent> <leader>ce :CocEnable<CR>

  " select inner/outer function in visual mode
  xmap if <Plug>(coc-funcobj-i)
  xmap of <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap of <Plug>(coc-funcobj-a)

  " refactorings
  nmap <leader><C-r> <Plug>(coc-rename)
  nmap <leader>a v<Plug>(coc-codeaction-selected)
  xmap <leader>a <Plug>(coc-codeaction-selected)

  " fixes
  nmap <leader>cff <Plug>(coc-fix-current)
  command! -nargs=0 CoqOrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
  nmap <leader> cfo :CoqOrganizeImports<cr>
  command! -nargs=0 CoqAutofix :call CocAction('runCommand', 'tsserver.executeAutofix')
  nmap <leader>cfi :CoqAutofix<cr>
  nmap <leader>cff :CocFix<cr>
  
  " Highlight References of Symbol under Cursor
  nnoremap <silent> L :call CocActionAsync('highlight')<CR>

  " Rust Inlay Hints
  au FileType rust nmap <silent><leader>ch  :CocCommand rust-analyzer.toggleInlayHints<CR>
  "}}}2
  
  " Coc Completion {{{2
  inoremap <silent><expr> <c-n> coc#refresh()

  if exists('*complete_info')
    inoremap <expr> <tab> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<tab>"
  else
    inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<tab>"
  endif
  "}}}2

  " Coc Documentation for Symbol under Cursor {{{2
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
  "}}}2

  " Coc Plugins {{{2
  """""""""""""""""

  " outline
  Plug 'liuchengxu/vista.vim'"
  "}}}2
  
" }}}1

call plug#end()

" PostInstalls {{{
""""""""""""""""""
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
" }}}

" Folding {{{
""""""""""""
au FileType rust,javascript,typescript set foldmethod=expr foldexpr=nvim_treesitter#foldexpr() nofoldenable foldlevelstart=10
au FileType vim set foldmethod=marker foldexpr=VimFolds(v:lnum) nofoldenable foldlevelstart=10
au FileType vim normal zM
" }}}
