-- lua/utils/snippets.lua
-- VERSION 2: Correctly delays the require('luasnip') call.

local M = {}

-- This function is now self-contained. It will only require 'luasnip'
-- when it is actually called, at which point the plugin will be loaded.
function M.load_latex_snippets()
	-- MOVED: All these lines are now INSIDE the function.
	local ls = require("luasnip")
	local s = ls.snippet
	local i = ls.insert_node
	local t = ls.text_node
	local f = ls.function_node

	-- Helper function to repeat the first node's content
	local function copy(args)
		return args[1]
	end

	ls.add_snippets("tex", {
		-- DOCUMENT STRUCTURE & PREAMBLE
		s("preamble", {
			t("\\documentclass{article}"),
			t({ "", "\\usepackage{amsmath}" }),
			t("\\usepackage{graphicx}"),
			t("\\usepackage[utf8]{inputenc}"),
			t({ "", "\\title{" }),
			i(1, "Title"),
			t("}"),
			t("\\author{" .. os.getenv("USER") .. "}"),
			t("\\date{\\today}"),
			t({ "", "\\begin{document}", "" }),
			t("\\maketitle"),
			t({ "", "" }),
			i(0),
			t({ "", "\\end{document}" }),
		}),
		s("sec", { t("\\section{"), i(1, "name"), t("}\\label{sec:"), f(copy, 1), t("}"), i(0) }),
		s("ssec", { t("\\subsection{"), i(1, "name"), t("}\\label{ssec:"), f(copy, 1), t("}"), i(0) }),
		s("sssec", { t("\\subsubsection{"), i(1, "name"), t("}\\label{sssec:"), f(copy, 1), t("}"), i(0) }),
		-- TEXT FORMATTING & CITATIONS
		s("bf", { t("\\textbf{"), i(1), t("}") }),
		s("it", { t("\\textit{"), i(1), t("}") }),
		s("ul", { t("\\underline{"), i(1), t("}") }),
		s("cite", { t("\\cite{"), i(1, "key"), t("}") }),
		s("ref", { t("\\ref{"), i(1, "label"), t("}") }),
		-- MATH MODE & SYMBOLS
		s("mk", { t("$"), i(1), t("$") }),
		s("dm", { t("\\[\n\t"), i(1), t("\n\\]") }),
		s("sr", t("^2")),
		s("cb", t("^3")),
		s("->", t("\\to ")),
		s("ff", { t("\\frac{"), i(1, "num"), t("}{"), i(2, "den"), t("}") }),
		s("sqrt", { t("\\sqrt{"), i(1), t("}") }),
		s("sum", { t("\\sum_{"), i(1, "i=1"), t("}^{"), i(2, "n"), t("}") }),
		s("int", { t("\\int_{"), i(1, "a"), t("}^{"), i(2, "b"), t("}") }),
		s("binc", { t("\\binom{"), i(1, "n"), t("}{"), i(2, "k"), t("}") }),
		s("vec", { t("\\vec{"), i(1, "v"), t("}") }),
		s("(", { t("\\left("), i(1), t("\\right)") }),
		s("[", { t("\\left["), i(1), t("\\right]") }),
		s("{", { t("\\left\\{"), i(1), t("\\right\\}") }),
		s("|", { t("\\left|"), i(1), t("\\right|") }),
		-- ENVIRONMENTS
		s("beg", { t("\\begin{"), i(1, "env"), t("}\n\t"), i(0), t("\n\\end{"), f(copy, 1), t("}") }),
		s("item", { t("\\begin{itemize}\n\t\\item "), i(1), t("\n\\end{itemize}") }),
		s("enum", { t("\\begin{enumerate}\n\t\\item "), i(1), t("\n\\end{enumerate}") }),
		s("eq", { t("\\begin{equation}\n\t"), i(1), t("\n\\end{equation}") }),
		s("ali", { t("\\begin{align*}\n\t"), i(1), t("\n\\end{align*}") }),
		s("fig", {
			t("\\begin{figure}[htbp]\n\t\\centering\n\t\\includegraphics[width=0.8\\textwidth]{"),
			i(1, "path"),
			t("}\n\t\\caption{"),
			i(2, "caption"),
			t("}\n\t\\label{fig:"),
			i(3, "label"),
			t("}\n\\end{figure}"),
		}),
		s("pmat", { t("\\begin{pmatrix}\n\t"), i(1), t("\n\\end{pmatrix}") }),
		s("bmat", { t("\\begin{bmatrix}\n\t"), i(1), t("\n\\end{bmatrix}") }),
	})
end

-- This part remains the same. We are exporting a table with the function.
return M
