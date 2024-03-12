local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local pi = ls.parent_indexer
local isn = require("luasnip.nodes.snippet").ISN
local psn = require("luasnip.nodes.snippet").PSN
local l = require "luasnip.extras".l
local r = require "luasnip.extras".rep
local p = require("luasnip.extras").partial
local events = require("luasnip.util.events")
local su = require("luasnip.util.util")

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(
      1,
      {
        -- Order is important, sn(...) first would cause infinite loop of expansion.
        t(""),
        sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})})
      }
    )
  )
end

local tex_utils = {}
tex_utils.in_mathzone = function()
  -- math context detection
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()
  -- comment detection
  return vim.fn["vimtex#syntax#in_comment"]() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn["vimtex#env#is_inside"](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()
  -- equation environment detection
  return tex_utils.in_env("equation")
end
tex_utils.in_itemize = function()
  -- itemize environment detection
  return tex_utils.in_env("itemize")
end
tex_utils.in_tikz = function()
  -- TikZ picture environment detection
  return tex_utils.in_env("tikzpicture")
end

return {
  s({trig = "tt", dscr = "Expands 'tt' into '\texttt{}'"}, fmta("\\texttt{<>}", {i(1)})),
  s(
    {trig = "([^%a])mm", wordTrig = false, regTrig = true},
    fmta(
      "<>$<>$",
      {
        f(
          function(_, snip)
            return snip.captures[1]
          end
        ),
        d(1, get_visual)
      }
    )
  ),
  s(
    {trig = "ff", snippetType = "autosnippet"},
    fmta(
      "\\frac{<>}{<>}",
      {
        i(1),
        i(2)
      }
    ),
    {condition = tex_utils.in_mathzone}
  ),
  s(
    {trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet"},
    fmta(
      "<>_{<>}",
      {
        f(
          function(_, snip)
            return snip.captures[1]
          end
        ),
        i(1)
      }
    ),
    {condition = in_mathzone}
  ),
  s(
    {trig = "env", snippetType = "autosnippet"},
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1) -- this node repeats insert node i(1)
      }
    )
  ),
  -- Recursive itemize
  s(
    "ls",
    {
      t({"\\begin{itemize}", "\t\\item "}),
      i(1),
      d(2, rec_ls, {}),
      t({"", "\\end{itemize}"})
    }
  ),
	s(
	  "cite",
		{
			"~\\cite{<>}", i(1)
		}
	)
}
