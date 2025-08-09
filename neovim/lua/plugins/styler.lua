return {
  'folke/styler.nvim',
  lazy = false,
  config = function() 
    require("styler").setup({
      themes = {
        lazygit = { colorscheme = "wombat_classic"},
        yazi = { colorscheme = "wombat_lush"},
      }
    })
  end
}
