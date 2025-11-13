return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Spectre requires plenary.nvim
  cmd = 'Spectre', -- Define the command to load the plugin
  keys = {
    { '<leader>S', "<cmd>lua require('spectre').toggle()<CR>", desc = 'Toggle Spectre' },
    -- You can add more keybindings here as needed
  },
  config = function()
    require('spectre').setup {
      -- Your custom Spectre configuration options go here
      -- For example:
      open_cmd = 'vnew', -- Open Spectre in a vertical split
      live_update = true, -- Automatically update search results
      mapping = {
        -- Customize keybindings within Spectre
        ['<leader>R'] = { map = "<cmd>lua require('spectre.actions').run_replace()<CR>", desc = 'Replace all' },
        ['<leader>rc'] = { map = "<cmd>lua require('spectre.actions').run_current_replace()<CR>", desc = 'Replace current' },
      },
      -- You can also configure find_engine, replace_engine, etc.
      -- Refer to the nvim-spectre documentation for a full list of options.
    }
  end,
}
