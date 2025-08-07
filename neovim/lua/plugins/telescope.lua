return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  cmd = { "Telescope" },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope Find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope Live grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope Help Tags' }
  },
  config = function() 
    local actions = require("telescope.actions")
    require("telescope").setup {
      defaults = {
        initial_mode = "normal",
        mappings = {
          i = {},
          n = { ["q"] = actions.close }
        }
      }
    }
  end
}
