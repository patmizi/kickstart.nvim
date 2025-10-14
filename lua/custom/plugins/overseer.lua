return {
  'stevearc/overseer.nvim',
  config = function()
    require('overseer').setup {
      templates = { 'builtin', 'user.cpp_build', 'user.cpp_build_and_run' },
    }
    vim.keymap.set('n', '<leader>o', '<cmd>OverseerToggle<cr>', { noremap = true })
    vim.keymap.set('n', '<F3>', '<cmd>OverseerToggle<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<F4>', '<cmd>OverseerRun<cr>', { noremap = true, silent = true })
  end,
  opts = {},
}
