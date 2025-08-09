return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  cmd = { "Telescope" },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>f', '<cmd>Telescope find_files<cr>', desc = 'Telescope Find files' },
    { '<leader>g', '<cmd>Telescope live_grep<cr>', desc = 'Telescope Live grep' },
    { '<leader>b', '<cmd>Telescope buffers<cr>', desc = 'Telescope Buffers' },
    { '<leader>h', '<cmd>Telescope help_tags<cr>', desc = 'Telescope Help Tags' },
    { '<leader>r', '<cmd>Telescope resume<cr>', desc = 'Telescope Previous search' },
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
