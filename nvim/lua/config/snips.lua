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
ls.add_snippets("cpp",{
  s('tc',{
    t({
    "int T;cin>>T;",
    "for(int testcases =0;testcases<T;testcases++)",
    "{","\t"
  }),i(0),
    t({"","}"})
  })
})

ls.add_snippets("cpp",{
  s("cp",{
    t({
      "#include<bits/stdc++.h>",
      "using namespace std;",
      "#define vi vector<int>",
      "#define ll long long",
      "#define ld long double",
      "#define imin INT_MIN",
      "#define imax INT_MAX",
      "#define endl '\\n' //to get all the inputs first and then ouput",
      "#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);",
      "const ll MOD = 1000000007;",
      "",
      "void solve(){",
      "",
    })
    ,t('\t'),i(1),
    t({
      "",
      "}",
      "",
      "int main(){",
      "\tfastio;",
      "\tsolve();",
      "\treturn 0;",
      "}"
  })
    ,i(0),
})
})