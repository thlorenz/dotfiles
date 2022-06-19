-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

require('plugin.which-key')

require('plugin.dash')
require('plugin.git')
require('plugin.nvim-tree')
require('plugin.tabular')
require('plugin.telescope')
require('plugin.treesitter')

require('plugin.null-ls')

lvim.plugins = {
  -- Tmux Integration
  { 'alexghergh/nvim-tmux-navigation', config = function()
    require 'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
      }
    }
  end
  },

  -- Editing
  { 'godlygeek/tabular', opt = true, cmd = { "Tabularize" } },
  { 'tpope/vim-abolish' },

  -- Tools
  { 'rizzatti/dash.vim',
    opt = true,
    cmd = { 'Dash' }
  },

  { 'wakatime/vim-wakatime' },
  { 'kristijanhusak/vim-carbon-now-sh', opt = true, cmd = { 'CarbonNowSh' } },

  { 'tpope/vim-fugitive', opt = true, cmd = { 'Git' } },
  { 'skanehira/gh.vim', opt = true, cmd = { 'gh' } },

  -- Make and Quickfix
  { 'radenling/vim-dispatch-neovim',
    requires = { 'tpope/vim-dispatch' },
    opt = true,
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  }
}

-- TODO:

--[[
Plug 'vimwiki/vimwiki'
  let g:vimwiki_list = [{'path': '~/.wiki', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_ext2syntax =  { '.md': 'markdown', '.markdown': 'markdown' }
  let g:vimwiki_markdown_link_ext = 1
  au FileType vimwiki nmap <leader>tl <Plug>VimwikiToggleListItem
  au FileType vimwiki vmap <leader>tl <Plug>VimwikiToggleListItem
  au BufRead,BufNewFile *.md set filetype=markdown conceallevel=0
]]

--[[
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

]]
