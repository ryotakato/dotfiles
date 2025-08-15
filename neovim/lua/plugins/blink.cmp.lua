return {
  'saghen/blink.cmp', 
  --build = 'cargo build --release',
  version = "*",
  event = { "InsertEnter", "CmdLineEnter" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      -- change TAB, S-TAB 
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else 
            local list = require('blink.cmp.completion.list')
            if #list.items == 1 then
              return cmp.select_and_accept()
            else
              return cmp.select_next()
            end
          end
        end,
        'snippet_forward',
        'fallback'
      },
      ['<S-Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else 
            local list = require('blink.cmp.completion.list')
            if #list.items == 1 then
              return cmp.select_and_accept()
            else
              return cmp.select_prev()
            end
          end
        end,
        'snippet_backward',
        'fallback'
      },
    },
    cmdline = {
      keymap = {
        preset = "enter",
      },
      completion = { menu = { auto_show = true } },
    },
    sources = {
      default = { "snippets", "lsp", "path", "buffer", "cmdline" },

      min_keyword_length = function(ctx)
        -- :wq, :qa -> menu doesn't popup
        -- :Lazy, :wqa -> menu popup
        if ctx.mode == "cmdline" and ctx.line:find("^%l+$") ~= nil then
          return 3
        end
        return 0
      end,
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    -- border
    completion = {
      documentation = { window = { border = "rounded" } },
      menu = { border = "rounded" },
      list = { selection = { preselect = false } }, -- auto select false
    },
    signature = { window = { border = "rounded" } },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    opts_extend = { "sources.default" }
  }
}

