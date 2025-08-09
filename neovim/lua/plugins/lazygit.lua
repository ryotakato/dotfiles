return {
  'kdheepak/lazygit.nvim', 
  lazy = true,
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit in the current working directory.' },
    { '<leader>lg', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit in the project root of the current file.' },
  },
}
