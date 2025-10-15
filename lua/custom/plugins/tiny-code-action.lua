return {
  'rachartier/tiny-code-action.nvim',
  config = function()
    local tca = require 'tiny-code-action'
    tca.setup {}
    vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
      tca.code_action {}
    end, '[C]ode [A]ction', { noremap = true, silent = true })
  end,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },

    -- optional picker via telescope
    { 'nvim-telescope/telescope.nvim' },
    -- optional picker via fzf-lua
    { 'ibhagwan/fzf-lua' },
    -- .. or via snacks
    {
      'folke/snacks.nvim',
      opts = {
        terminal = {},
      },
    },
  },
  event = 'LspAttach',
  opts = {},
}
