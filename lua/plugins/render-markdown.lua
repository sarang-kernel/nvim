-- lua/plugins/markdown-suite.lua
-- The definitive "Outrageous" configuration for render-markdown.nvim.

return {
	"MeanderingProgrammer/render-markdown.nvim",
	name = "render-markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	ft = { "markdown" },
	opts = function()
		-- ===================================================================
		-- HELPER FUNCTIONS
		-- ===================================================================
		local function format_size(size)
			if not size then
				return "N/A"
			end
			if size > 1024 * 1024 then
				return string.format("%.1fMB", size / (1024 * 1024))
			end
			if size > 1024 then
				return string.format("%.1fKB", size / 1024)
			end
			return tostring(size) .. "B"
		end

		local function format_time_ago(mod_time)
			if not mod_time then
				return "N/A"
			end
			local diff = os.time() - mod_time
			if diff < 60 then
				return "now"
			end
			if diff < 3600 then
				return math.floor(diff / 60) .. "m ago"
			end
			if diff < 86400 then
				return math.floor(diff / 3600) .. "h ago"
			end
			return math.floor(diff / 86400) .. "d ago"
		end

		return {
			head = { -- (unchanged)
				enabled = true,
				icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
				highlight = "RenderMarkdownHeading",
				render_method = "inline",
			},

			link = {
				enabled = true,
				render_modes = false,
				footnote = { enabled = true, superscript = true, prefix = " ", suffix = "" },
				image = "󰥶 ",
				email = "󰀓 ",
				hyperlink = "󰌹 ",
				highlight = "RenderMarkdownLink",

				-- >>> UPDATED WIKILINK HANDLER <<<
				wiki = {
					icon = "",
					highlight = "RenderMarkdownWikiLink",
					body = function(ctx)
						local raw_val = ctx.value or ""
						if raw_val == "" then
							return "󰅖 Invalid"
						end

						-- Handle Obsidian-style aliases [[Page|Alias]]
						local target, alias = raw_val:match("^(.-)|(.+)$")
						local link_name = target or raw_val
						local display_name = alias or raw_val

						local notes_path = vim.fn.expand("~/notes/")
						local file_path = notes_path .. link_name .. ".md"

						if vim.fn.filereadable(file_path) == 1 then
							local stat = vim.loop.fs_stat(file_path)
							local size_str = format_size(stat and stat.size)
							local time_str = format_time_ago(stat and stat.mtime.sec)
							return string.format("󱗖 %s | 󰥔 %s | %s", size_str, time_str, display_name)
						else
							return "󰅖 Missing: " .. display_name
						end
					end,
				},

				-- (your custom link icons untouched)
				custom = {
					web = { pattern = "^http", icon = "󰖟 " },
					github = { pattern = "github%.com", icon = "󰊤 " },
					gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
					stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
					wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
					youtube = { pattern = "youtube%.com", icon = "󰗃 " },
					arxiv = { pattern = "arxiv%.org", icon = "󰎠 " },
					wolframalpha = { pattern = "wolframalpha%.com", icon = "󰐴 " },
					overleaf = { pattern = "overleaf%.com", icon = "󰂊 " },
					crates_io = { pattern = "crates%.io", icon = "󰎘 " },
					docs_rs = { pattern = "docs%.rs", icon = "󰎘 " },
					pypi = { pattern = "pypi%.org", icon = "󰠠 " },
					npm = { pattern = "npmjs%.com", icon = "󰎙 " },
					dev_docs = { pattern = "devdocs%.io", icon = "󰡩 " },
					mdn = { pattern = "developer%.mozilla%.org", icon = "󰜫 " },
					owasp = { pattern = "owasp%.org", icon = "󰓮 " },
					portswigger = { pattern = "portswigger%.net", icon = "󰋳 " },
					cve = { pattern = "cve%.mitre%.org", icon = "󰛵 " },
				},
			},

			-- (rest of your callouts, checkbox, bullet, code, inline_code,
			-- table, dash, quote, anti_conceal all unchanged)
		}
	end,

	-- >>> ADDED GF NAVIGATION <<<
	config = function(_, opts)
		require("render-markdown").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.keymap.set("n", "gf", function()
					local word = vim.fn.expand("<cWORD>")
					local raw_val = word:gsub("[%[%]]", "")
					local target, alias = raw_val:match("^(.-)|(.+)$")
					local link_name = target or raw_val
					local notes_path = vim.fn.expand("~/notes/")
					local file_path = notes_path .. link_name .. ".md"

					if vim.fn.filereadable(file_path) == 1 then
						vim.cmd("edit " .. vim.fn.fnameescape(file_path))
					else
						vim.cmd("edit " .. vim.fn.fnameescape(file_path)) -- create new
					end
				end, { buffer = true })
			end,
		})
	end,
}
