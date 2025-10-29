return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {
      padding = true,
      sticky = true,
      ignore = nil,
      toggler = {
        line = 'gcc',
        block = 'gbc',
      },
      opleader = {
        line = 'gc',
        block = 'gb',
      },
      extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
      },
      mappings = {
        basic = true,
        extra = true,
      },
    }

    local api = require 'Comment.api'
    local comment_keys = { '<C-_>', '<C-/>' }

    for _, key in ipairs(comment_keys) do
      -- Normal mode
      vim.keymap.set('n', key, function()
        api.toggle.linewise.current()
      end, { noremap = true, silent = true })

      -- Visual mode - fixed version
      vim.keymap.set('x', key, function()
        local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end, { noremap = true, silent = true })
    end
  end,
}
