-- heavily inspired by https://github.com/numToStr/Comment.nvim/blob/master/lua/Comment/ft.lua
local M = {}

local C = {
  cxx = '//',
  hash = '#',
  double_hash = '##',
  dash = '--',
  dash_bracket = '--[[]]',
  haskell_b = '{--}',
  fsharp_b = '(**)',
  html = '<!---->',
  latex = '%',
  lisp_l = ';;',
  lisp_b = '#||#',
}

---Lang table that contains commentstring (linewise/blockwise) for mutliple filetypes
---@type table { filetype = { linewise, blockwise } }
local L = {
  bash = C.hash,
  bib = C.latex,
  c = C.cxx,
  cabal = C.dash,
  cmake = C.hash,
  conf = C.hash,
  conkyrc = C.dash,
  cpp = C.cxx,
  cs = C.cxx,
  css = C.cxx_b,
  cuda = C.cxx,
  dhall = C.dash,
  dot = C.cxx,
  eelixir = C.html,
  elixir = C.hash,
  elm = C.dash,
  fennel = C.lisp_l,
  fish = C.hash,
  fsharp = C.cxx,
  gdb = C.hash,
  gdscript = C.hash,
  gleam = C.cxx,
  go = C.cxx,
  graphql = C.hash,
  groovy = C.cxx,
  haskell = C.dash,
  heex = C.html,
  html = C.html,
  htmldjango = C.html,
  idris = C.dash,
  ini = C.hash,
  java = C.cxx,
  javascript = C.cxx,
  javascriptreact = C.cxx,
  jsonc = C.cxx,
  julia = C.hash,
  kotlin = C.cxx,
  lidris = C.dash,
  lisp = C.lisp_l,
  lua = C.dash,
  markdown = C.html,
  make = C.hash,
  mbsyncrc = C.double_hash,
  meson = C.hash,
  nix = C.hash,
  ocaml = C.fsharp_b,
  purescript = C.dash,
  python = C.hash, -- Python doesn't have block comments
  php = C.cxx,
  r = C.hash, -- R doesn't have block comments
  readline = C.hash,
  ruby = C.hash,
  rust = C.cxx,
  scala = C.cxx,
  scheme = C.lisp_l,
  sh = C.hash,
  sql = C.dash,
  svelte = C.html,
  swift = C.cxx,
  sxhkdrc = C.hash,
  teal = C.dash,
  terraform = C.hash,
  tex = C.latex,
  template = C.double_hash,
  tmux = C.hash,
  toml = C.hash,
  typescript = C.cxx,
  typescriptreact = C.cxx,
  vim = '"',
  vue = C.html,
  xml = C.html,
  xdefaults = '!',
  yaml = C.hash,
  zig = C.cxx
}

function M.contains(tree)
  for lang, child in pairs(tree:children()) do
    if lang ~= 'comment' and child:contains() then
      return M.contains(child)
    end
  end

  return tree
end

M.get_comment_string = function()
  local ft = vim.bo.filetype

  if ft == nil then return '//' end
  local comment = L[ft]
  if comment == nil then return '//' end

  return comment
end

return M
