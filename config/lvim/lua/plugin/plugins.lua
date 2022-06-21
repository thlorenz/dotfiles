-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- https://lunarvim.org/plugins

require('plugin.cmp')
require('plugin.copilot')
require('plugin.dap')
require('plugin.dapui')
require('plugin.dash')
require('plugin.git')
require('plugin.lsp')
require('plugin.nvim-tree')
require('plugin.rust-tools')
require('plugin.tabular')
require('plugin.telescope')
require('plugin.test')
require('plugin.treesitter')

require('plugin.null-ls')

-- Disabled Core Plugins
lvim.builtin.autopairs.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.comment.active = false
lvim.builtin.project.active = false
lvim.builtin.alpha.active = false
lvim.builtin.terminal.active = false
lvim.builtin.dap.active = true

-- Added Plugins
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

  -- Telescope Extensions
  { 'nvim-telescope/telescope-ui-select.nvim' },
  -- cmp
  { 'hrsh7th/cmp-nvim-lua', },

  -- Editing
  { 'godlygeek/tabular', opt = true, cmd = { "Tabularize" } },
  { 'tpope/vim-abolish' },

  -- Tools/LSP/Debugging
  { 'simrat39/rust-tools.nvim',
    require = { 'mfussenegger/nvim-dap' }
  },
  { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } },
  { 'github/copilot.vim' },

  -- Tools
  { 'rizzatti/dash.vim',
    opt = true,
    cmd = { 'Dash' }
  },

  { 'wakatime/vim-wakatime' },
  { 'kristijanhusak/vim-carbon-now-sh', opt = true, cmd = { 'CarbonNowSh' } },

  { 'tpope/vim-fugitive',
    opt = true,
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  { 'skanehira/gh.vim', opt = true, cmd = { 'gh' } },

  -- Make and Quickfix
  { 'tpope/vim-dispatch',
    opt = true,
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  },

  -- Theme
  { 'challenger-deep-theme/vim',
    as = 'challenger_deep',
    config = function()
      pcall(function()
        if lvim and lvim.colorscheme == "challenger_deep" then
          lvim.builtin.lualine.options.theme = "challenger_deep"
        end
      end)
    end,
    -- disable = lvim.colorscheme ~= 'challenger_deep'
  },

  -- startup
  { 'mhinz/vim-startify',
    config = function()
      require 'plugin.startify'
    end
  },

  -- tests
  { 'vim-test/vim-test',
    opt = true,
    cmd = { 'TestNearest', 'TestLast' }
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
