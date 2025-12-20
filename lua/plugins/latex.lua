-- -- lua/plugins/latex.lua
-- -- A complete setup to create an Overleaf-like experience for LaTeX.
-- -- VERSION 4: With manually forced keymaps for maximum reliability.
--
-- return {
-- 	-- 1. The Core: VimTeX
-- 	{
-- 		"lervag/vimtex",
-- 		ft = { "tex", "latex", "bib" },
-- 		config = function()
-- 			-- Basic VimTeX configuration
-- 			vim.g.vimtex_leader_key = ","
-- 			vim.g.vimtex_view_method = "zathura"
-- 			vim.g.vimtex_compiler_method = "tectonic"
-- 			vim.g.vimtex_compiler_latexmk = {
-- 				engine = "-pdftectonic",
-- 			}
-- 			vim.g.vimtex_syntax_conceal = { enabled = 1 }
--
-- 			-- ===================================================================
-- 			-- THE FIX: Manually set the keymaps here.
-- 			-- This bypasses any potential conflicts or loading order issues.
-- 			-- We use <Cmd> for clean, non-recordable commands.
-- 			-- ===================================================================
-- 			local map = vim.keymap.set
-- 			local opts = { silent = true, noremap = true, desc = "VimTeX" }
--
-- 			-- We map directly to the Vimtex commands.
-- 			-- This is guaranteed to work because we already proved :VimtexInfo works.
-- 			map("n", ",ll", "<Cmd>VimtexCompile<CR>", { desc = "VimTeX: Compile" })
-- 			map("n", ",lv", "<Cmd>VimtexView<CR>", { desc = "VimTeX: View PDF" })
-- 			map("n", ",lk", "<Cmd>VimtexStop<CR>", { desc = "VimTeX: Stop Viewer" })
-- 			map("n", ",le", "<Cmd>VimtexErrors<CR>", { desc = "VimTeX: Show Errors" })
-- 			map("n", ",lc", "<Cmd>VimtexClean<CR>", { desc = "VimTeX: Clean Project" })
-- 			map("n", ",li", "<Cmd>VimtexInfo<CR>", { desc = "VimTeX: Show Info" })
-- 		end,
-- 	},
--
-- 	-- 2. The Brains: LSP for LaTeX (texlab)
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		opts = {
-- 			servers = {
-- 				texlab = {},
-- 			},
-- 		},
-- 	},
--
-- 	-- 3. The Stylist: Treesitter for better syntax highlighting
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = function(_, opts)
-- 			opts.ensure_installed = opts.ensure_installed or {}
-- 			vim.list_extend(opts.ensure_installed, { "latex" })
-- 		end,
-- 	},
--
-- 	-- 4. The Typist: Snippets for LaTeX
-- 	{
-- 		"rafamadriz/friendly-snippets",
-- 	},
-- }
--
-- lua/plugins/latex.lua
-- A complete setup to create an Overleaf-like experience for LaTeX.
-- VERSION 4.1: latexmk default, Tectonic optional.

return {
	-- 1. The Core: VimTeX
	{
		"lervag/vimtex",
		ft = { "tex", "latex", "bib" },
		config = function()
			-- Basic VimTeX configuration
			vim.g.vimtex_leader_key = ","
			vim.g.vimtex_view_method = "zathura"

			----------------------------------------------------------------
			-- DEFAULT COMPILER (Overleaf-like, multi-pass, journal-safe)
			----------------------------------------------------------------
			vim.g.vimtex_compiler_method = "latexmk"

			vim.g.vimtex_compiler_latexmk = {
				options = {
					"-pdf",
					"-interaction=nonstopmode",
					"-synctex=1",
				},
			}

			----------------------------------------------------------------
			-- OPTIONAL COMPILER: Tectonic
			-- Single-pass, fast, will keep some hyperref warnings.
			-- Enable manually when desired.
			----------------------------------------------------------------
			-- vim.g.vimtex_compiler_method = "tectonic"
			-- vim.g.vimtex_compiler_tectonic = {
			--   options = { "--synctex" },
			-- }

			vim.g.vimtex_syntax_conceal = { enabled = 1 }

			----------------------------------------------------------------
			-- Keymaps (unchanged, explicit, reliable)
			----------------------------------------------------------------
			local map = vim.keymap.set
			local opts = { silent = true, noremap = true, desc = "VimTeX" }

			map("n", ",ll", "<Cmd>VimtexCompile<CR>", opts)
			map("n", ",lv", "<Cmd>VimtexView<CR>", opts)
			map("n", ",lk", "<Cmd>VimtexStop<CR>", opts)
			map("n", ",le", "<Cmd>VimtexErrors<CR>", opts)
			map("n", ",lc", "<Cmd>VimtexClean<CR>", opts)
			map("n", ",li", "<Cmd>VimtexInfo<CR>", opts)
		end,
	},

	-- 2. The Brains: LSP for LaTeX
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				texlab = {},
			},
		},
	},

	-- 3. The Stylist: Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "latex" })
		end,
	},

	-- 4. The Typist: Snippets
	{
		"rafamadriz/friendly-snippets",
	},
}
