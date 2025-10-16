return {
  'akinsho/toggleterm.nvim',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('toggleterm').setup {}
    vim.keymap.set('n', '<C-\\>', function()
      require('toggleterm').toggle()
    end, { noremap = true, silent = true })
    vim.keymap.set('t', '<C-\\>', function()
      require('toggleterm').toggle()
    end, { noremap = true, silent = true })
  end,
}
