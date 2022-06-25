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
    { key = "rust" }
  })

  -- --------------
  -- Rust
  -- --------------
  ls.add_snippets("rust", {
    header(),
    todo(),
    s({ trig = "epr", name = "eprintln debug" },
      fmt([[ eprintln!("{{:#?}}", {}); ]], { i(1) })
    ),

    s({ trig = "tst", name = "Unit test function" },
      fmt([[
        #[test]
        fn {}() {{
          {}
        }}
      ]], { i(1, "function_name"), i(0) })
    ),

    s({ trig = "syne", name = "syn ParseError and ParseResult" },
      t "use syn::{Error as ParseError, Result as ParseResult};"
    ),

    { key = "rust" }
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

    s({ trig = "ima", name = "import strict assert" },
      t "import { strict as assert } from 'assert'"
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

  -- --------------
  -- Markdown
  -- --------------
  ls.add_snippets("markdown", {
    header(),
    { key = "markdown" }
  })

  -- --------------
  -- Yaml
  -- --------------
  ls.add_snippets("yaml", {
    header(),
    { key = "yaml" }
  })
end

M.setup()
return M
