 -- Treesitter: Syntax highlighting 
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Calling treesitter
    local config = require("nvim-treesitter")
    require("lazy").setup({{
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              -- ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "python", "rust", "markdown" },
              auto_install=true,
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },
            })
        end
     }})
    -- Make sure to setup `mapleader` and `maplocalleader` before
    -- loading lazy.nvim so that mappings are correct.
    -- This is also a good place to setup other settings (vim.opt)
    -- vim.g.mapleader = ' '
    -- vim.g.maplocalleader = "\\"

    -- -- Setup lazy.nvim
    -- require("lazy").setup({
    --   spec = {
    --     -- import your plugins
    --     { import = "plugins" },nvim-telescope/telescope-ui-select.nvimnvim-telescope/telescope-ui-select.nvim
    --   },
    --   -- Configure any other settings here. See the documentation for more details.nvim-telescope/telescope-ui-select.nvim
    --   -- colorscheme that will be used when installing plugins.
    --   -- install = { colorscheme = { "habamax" } },
    --   -- automatically check for plugin updates
    --   -- checker = { enabled = true },
    -- })
  end 
}

