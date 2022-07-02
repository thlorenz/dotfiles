local M = {}
local neorg = require('neorg')

M.setup = function()
  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.norg.dirman"] = {
        config = {
          workspaces = {
            work = "~/dotfiles/org/work",
            personal = "~/dotfiles/org/personal",
            metaplex = "~/dotfiles/org/work/metaplex",
          }
        }
      }
    }
  }
end

return M
