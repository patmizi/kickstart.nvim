return {
  'oribarilan/lensline.nvim',
  tag = '2.0.0', -- or: branch = 'release/2.x' for latest non-breaking updates
  -- branch = 'release/2.x',
  event = 'LspAttach',
  config = function()
    local lensline = require 'lensline'
    lensline.setup {
      profiles = {
        {
          name = 'basic',
          providers = {
            { name = 'last_author', enabled = true },
            { name = 'diagnostics', enabled = true, min_level = 'WARN' },
          },
          style = {
            separator = ' • ',
            highlight = 'Comment',
            prefix = '┃ ',
            placement = 'above', -- "above" | "inline" - where to render lenses
            use_nerdfont = true, -- enable nerd font icons in built-in providers
            render = 'all', -- "all" (existing behavior) | "focused" (only active window's focused function)
          },
        },
      },
    }
    lensline.switch_profile 'basic'
  end,
}
