return {
  'akinsho/toggleterm.nvim', version = "*",
  lazy = false,
  keys = {
    { '<leader>t', '<cmd>ToggleTerm<cr>', desc = 'ToggleTerm' },
  },
  config = function() 
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      start_in_insert = false,
      direction = 'vertical',
    })

    local Terminal  = require('toggleterm.terminal').Terminal
    local todotui = Terminal:new({ 
      cmd = "todotui ~/todotui/todo.txt", 
      hidden = true, 
      direction = "float", 
      on_open = function()
        vim.cmd('startinsert!')
      end
    })

    function _todotui_toggle()
      todotui:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua _todotui_toggle()<CR>", { noremap = true, silent = true})

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
