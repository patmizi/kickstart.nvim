return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      -- Configure nvim-notify first
      require('notify').setup {
        stages = 'fade_in_slide_out',
        timeout = 3000,
        background_colour = '#000000',
        top_down = false,
      }
      -- Set notify as the default notification handler
      vim.notify = require 'notify'
      -- Configure noice
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        cmdline = {
          enabled = true,
        },
        popupmenu = {
          enabled = true,
          backend = 'nui', -- Change from 'cmp' to 'nui'
        },
        -- Route messages to notify
        routes = {
          {
            view = 'notify',
            filter = { event = 'msg_showmode' },
          },
        },
      }
    end,
  },
}
