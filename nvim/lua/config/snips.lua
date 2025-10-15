-- luasnip.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require('luasnip.extras')
local rep = extras.rep





ls.add_snippets("cpp", {
	s("cb", {
		t({
			"#include<bits/stdc++.h>",
			"using namespace std;",
			"int main(){",
			"",
		})
		, t('\t'), i(1),
		t({
			"",
			"\treturn 0;",
			"}"
		})
		, i(0),
	})
})
ls.add_snippets("python", {
	s('tc', {
		t({
			"T = literal_eval(input())",
			"for _ in range(T):",
			"\tsolve()"
	 })
	})
})
ls.add_snippets("python", {
	s('inp', {
		i(0, {"a"}),
		t({
			" = literal_eval(input())",
	 })
	})
})
ls.add_snippets("cpp", {
	s('tc', {
		t({
			"int tc;cin>>tc;",
			"while(tc--)",
			"{", "\t"
		}), i(0),
		t({ "", "}" })
	})
})

ls.add_snippets("cpp", {
	s("cp", {
		t({
			"#include<bits/stdc++.h>",
			"using namespace std;",
			"#define vi vector<int>",
			"#define vvi vector<vector<int>>",
			"#define mii map<int,int>",
			"#define umii unordered_map<int, int>",
			"#define ll long long",
			"#define ld long double",
			"#define imin INT_MIN",
			"#define imax INT_MAX",
			"#define endl '\\n' //to get all the inputs first and then ouput",
			"#define fastio ios_base::sync_with_stdio(false);cin.tie(NULL);",
			"const ll MOD = 1000000007;",
			"",
			"//Functions",
			"#define printv(a) for(auto it:a){cout<<it<<\",\";}",
			"",
			"void solve(){",
			"",
		})
		, t('\t'), i(1),
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
		, i(0),
	})
})
ls.add_snippets("python", {
	s("cp", {
		t({
			"import sys,math,copy",
			"from collections import *",
			"from sortedcontainers import *",
			"from bisect import *",
			"from typing import *",
			"from ast import literal_eval",
			"input = sys.stdin.readline",
			"",
			"MAX = 10 ** 18",
			"MOD = 10 ** 9 + 7",
			"",
			"def solve():",
			"\treturn",
			"",
			"def main():",
			"",
		})
		, t('\t'), i(1),
		t({
			"",
			"\treturn",
			"",
			"if __name__ ==  \"__main__\" :",
			"\tmain();",
		})
		, i(0),
	})
})

local function add_time()
	return os.date("%H:%M")
end
ls.add_snippets("markdown", {
	s("log-time", {
		t("# "),
		f(add_time, {}), -- inserts current time
		t({ "", "" }),   -- newline after the heading
		i(0),            -- cursor goes here
		t({ "","", "---" }), -- separator
	}),
})
