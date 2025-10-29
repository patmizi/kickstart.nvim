return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        center = {
          {
            icon = '  ',
            desc = 'Recent Projects                         ',
            key = 'p',
            action = 'Telescope neovim-project history',
          },
          {
            icon = '  ',
            desc = 'Find Projects                           ',
            key = 'P',
            action = 'Telescope neovim-project discover',
          },
          {
            icon = '  ',
            desc = 'Recently Opened Files                   ',
            key = 'r',
            action = 'Telescope oldfiles',
          },
          {
            icon = '  ',
            desc = 'Find File                               ',
            key = 'f',
            action = 'Telescope find_files',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
