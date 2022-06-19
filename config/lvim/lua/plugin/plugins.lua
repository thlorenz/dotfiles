-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

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
  }
}
