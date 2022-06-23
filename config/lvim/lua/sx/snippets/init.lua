---@diagnostic disable: unused-local
local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")


local buffer = require('sx.snippets.utils.buffer')

local M = {}

-- --------------
-- Common
-- --------------
local header = function()
  return s({ trig = "hdr", name = "Dynamic Header" }, fmt([[
      {comment} --------------
      {comment} {}
      {comment} --------------
      ]], {
    i(1, 'hdr'),
    comment = f(buffer.get_comment_string)
  })
  )
end

local todo = function()
  return s("todo", fmt(
    '{comment} TODO (thlorenz): {}',
    { i(1), comment = f(buffer.get_comment_string) }
  ))
end

M.setup = function()

  -- --------------
  -- Lua
  -- --------------
  ls.add_snippets("lua", {
    header(),
    todo(),
  })

  -- --------------
  -- Rust
  -- --------------
  ls.add_snippets("rust", {
    header(),
    todo(),
  })

  -- --------------
  -- TypeScript
  -- --------------
  ls.add_snippets("typescript", {
    header(),
    todo(),
    s({ trig = "imfs", name = "import fs promises" },
      t "import { promises as fs } from 'fs'"
    ),

    s({ trig = "tst", name = "tape test" },
      fmt([[
      test('{}', (t) => {{
        {} 
      }})
    ]] , { i(1), i(2) })
    ),

    s({ trig = "tst", name = "tape test" },
      fmt([[
      test('{}', (t) => {{
        {} 
      }})
    ]] , { i(1), i(2) })
    ),

    s({ trig = "main", name = "main function" },
      fmt([[
      async function main() {{
        {}	
      }}

      main()
        .then(() => process.exit(0))
        .catch((err: any) => {{
          console.error(err)
          process.exit(1)
        }})
    ]] , { i(1) })
    ),

    { key = "typescript" }
  })
end

return M
