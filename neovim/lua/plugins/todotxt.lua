return {
  "phrmendes/todotxt.nvim",
  lazy = false,
  keys = {
    { '<leader>dn', '<cmd>TodoTxt new<cr>', desc = 'New todo entry' },
    { '<leader>dt', '<cmd>TodoTxt<cr>', desc = 'Toggle todo.txt' },
    { '<leader>dd', '<cmd>DoneTxt<cr>', desc = 'Toggle done.txt' },
  },
  config = function() 
    require("todotxt").setup({
      todotxt = vim.env.HOME .. "/todotxt.nvim/todo.txt",
      donetxt = vim.env.HOME .. "/todotxt.nvim/done.txt",
    })

    vim.api.nvim_create_user_command("TodoTxtSort", function(args)
        local cmd = args.fargs[1]

        if not cmd then
            require("todotxt").sort_tasks()
        elseif cmd == "priority" then
            require("todotxt").sort_tasks_by_priority()
        elseif cmd == "context" then
            require("todotxt").sort_tasks_by_context()
        elseif cmd == "project" then
            require("todotxt").sort_tasks_by_project()
        elseif cmd == "due_date" then
            require("todotxt").sort_tasks_by_due_date()
        else
            vim.notify("TodoTxtSort: Unknown command: " .. cmd .. ". Available: priority, context, project, due_date", vim.log.levels.ERROR)
        end
    end, {
        nargs = "?",
        desc = "TodoTxtSort commands (default: tasks, 'priority': priority, 'context': context, 'project': project, 'due_date': due date)",
        complete = function(arg)
            local cmds = { "priority", "context", "project", "due_date" }
            return vim.iter(cmds):filter(function(c) return c:find(arg, 1, true) end):totable()
        end,
    })

    vim.api.nvim_create_user_command("TodoTxtClean", function() require("todotxt").move_done_tasks() end, {
        nargs = 0,
        desc = "Move done tasks",
    })
    vim.api.nvim_create_user_command("TodoTxtState", function() require("todotxt").toggle_todo_state() end, {
        nargs = 0,
        desc = "Toggle todo state",
    })
    vim.api.nvim_create_user_command("TodoTxtCycle", function() require("todotxt").cycle_priority() end, {
        nargs = 0,
        desc = "Cycle priority",
    })

    vim.api.nvim_set_keymap("n", "<leader>dx", '<cmd>TodoTxtState<CR>', { noremap = true, buffer = bufnr, desc = "Toggle todo state", })
    vim.api.nvim_set_keymap("n", "<leader>dp", '<cmd>TodoTxtCycle<CR>', { noremap = true, buffer = bufnr, desc = "Cycle priority", })

  end
}
