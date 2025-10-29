-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set term gui colours
vim.opt.termguicolors = true

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPLugin = 1

-- Custom Diagnostic Underline Colours -- NOTE: this doesn't seem to work well with Alacritty
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
  underline = true,
  sp = '#ff0000',
  bg = '#3d1f1f', -- Dark red background
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {
  underline = true,
  sp = '#ffaa00',
  bg = '#3d2f1f', -- Dark orange background
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', {
  underline = true,
  sp = '#00ffff',
  bg = '#1f2f3d', -- Dark blue background
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {
  underline = true,
  sp = '#00ff00',
  bg = '#1f3d1f', -- Dark green background
})

-- Open neo-tree and focus it on opening neovim
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if directory then
      vim.cmd.bd(1)
      require('neo-tree.command').execute {
        action = 'focus',
        source = 'filesystem',
        position = 'left',
      }
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
