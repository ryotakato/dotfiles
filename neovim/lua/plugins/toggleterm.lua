return {
  'akinsho/toggleterm.nvim', version = "*",
  lazy = false,
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm' },
  },
  opts = {
    
  },
  config = function() 
    require("toggleterm").setup()

    --local Terminal  = require('toggleterm.terminal').Terminal
    --local yazi = Terminal:new({ cmd = "yazi", hidden = true, direction = "float", })
    --local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", })
    --
    --function _lazygit_toggle()
    --  lazygit:toggle()
    --end
    --function _yazi_toggle()
    --  yazi:toggle()
    --end

    --vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    --vim.api.nvim_set_keymap("n", "<leader>ty", "<cmd>lua _yazi_toggle()<CR>", {noremap = true, silent = true})
  end
}
