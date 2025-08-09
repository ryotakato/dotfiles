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
      open_file_in_vertical_split = false,
      open_file_in_horizontal_split = false,
      open_file_in_tab = "<c-t>",
      grep_in_directory = "<c-s>",
      replace_in_directory = "<c-g>",
      cycle_open_buffers = "<tab>",
      copy_relative_path_to_selected_files = "<c-y>",
      send_to_quickfix_list = "<c-q>",
      change_working_directory = "<c-\\>",
      open_and_pick_window = "<c-o>",
    },
  },
}

