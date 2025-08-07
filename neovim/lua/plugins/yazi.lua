return {
  'mikavilpas/yazi.nvim', 
  event = "VeryLazy",
  dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
  keys = {
    { '<leader>yz', '<cmd>Yazi<cr>', desc = 'Open yazi at the current file' },
    { '<leader>yw', '<cmd>Yazi cwd<cr>', desc = "Open the file manager in nvim's working directory" },
    { '<leader>yt', '<cmd>Yazi toggle<cr>', desc = 'Resume the last yazi session' },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}

