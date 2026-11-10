-- lualine: the status line (dracula theme; the catppuccin theme line is commented out).
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
        -- theme = 'catppuccin'
      }
    })
  end
}
