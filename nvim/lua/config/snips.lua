-- luasnip.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require('luasnip.extras')
local rep = extras.rep





ls.add_snippets("cpp",{
  s("cb",{
    t({
      "#include<bits/stdc++.h>",
      "using namespace std;",
      "int main(){",
      "",
    })
    ,t('\t'),i(1),
    t({
      "",
      "\treturn 0;",
      "}"
    })
    ,i(0),
  })
})