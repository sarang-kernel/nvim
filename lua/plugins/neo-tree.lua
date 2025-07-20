return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "3rd/image.nvim", opts = {} },
    "folke/snacks.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30, -- ✅ This sets the default width of Neo-tree
      },
    })
  end,
}

